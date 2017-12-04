# -*- coding: ms949 -*-
'''
Created on 2017. 11. 29.

@author: home
'''

# In[1]:
import cx_Oracle
from math import sqrt
conn = cx_Oracle.connect('web/web@192.168.0.11:1521/xe')
cur=conn.cursor()


# 1.Member 딕셔너리 생성
members={}

# 2. Members 딕셔너리에 회원의 여행 속성 추가

cur.execute('SELECT * FROM member')
mem_test=cur.fetchall()
for result in mem_test:
    idp = result[1]
    name=result[3]
    type_1=result[7]
    type_2=result[8]
    members[idp]={'type':[type_1,type_2]}


# 3. 회원들의 id값 불러오기
memberi=cur.execute('SELECT mem_id FROM member')
memberid=[]
for i in memberi:
    memberid.append(i[0])

# 4. Members 딕셔너리에 회원들이 다녀온 여행지 및 평점 추가

for i in memberid: #iterating the list using index(int)
    cur.execute('select * from goneTourList where id=(:b)',b=i) #here cursor is using the existing cursor objec
    k=cur.fetchall()
   
    for j in k:
        cur.execute('select tour_type from tour_list where tour_name=(:a)',a=j[1]) #here cursor is using the existing cursor objec
        d=cur.fetchone()
        
        gone =  j[1]
             
        members[i][gone]=(d[0],j[2])
        

# 피어슨상관계수

def sim_pearson(data, person1, person2):
    sumX = 0;
    sumY = 0;
    sumPowX = 0;
    sumPowY = 0;
    sumXY= 0;
    
    tour_lis=[]
   
    for i in data[person1]:
        if i =='type':continue
        if i in data[person2]:
            if i =='type':continue
            tour_lis.append(i)
            
    if len(tour_lis)==0 : return 0
    
    for x in tour_lis:
        sumX+=data[person1][x][1]
        sumY+=data[person2][x][1]
        sumPowX+=pow(data[person1][x][1],2)
        sumPowY+=pow(data[person2][x][1],2)
        sumXY+=data[person1][x][1]*data[person2][x][1]
    
    coval = sumXY-sumX*sumY/len(tour_lis)
    varX= sumPowX-pow(sumX,2)/len(tour_lis)
    
    varY= sumPowY-pow(sumY,2)/len(tour_lis)
    if varX*varY==0:return 0
    r=coval/sqrt(varX*varY)
    
    return r
   

def sim_distance(data,person1,person2):
   
    sum=0
    for i in data[person1]:
        if i =='type':continue
        if i in data[person2]:
            if i =='type':continue
            minus = data[person1][i][1]-data[person2][i][1]
            sum+=pow(minus,2)
        
    distance=sqrt(sum)    
    score=1/(1+distance)
    
    return score


# In[45]:

def top_match(data, person, n=3, sim_function=sim_distance):#default값 설정가능 함수호출할때 입력안하면 디폴트값으로
    match_list=[]
    match_person=[]
    
    for p in data:
        if p != person:
            match_person.append(p)
            
          
    for i in match_person:
        score=sim_function(data,person, i)
        match_list.append((score,i))
    print(match_list)
    match_list.sort()
    match_list.reverse()
    return match_list[:n]


# In[71]:

def getRecommendation(data, person,sim_funciton=sim_pearson):
    result = top_match(members,person,3,sim_pearson)
    score_dic={}
    simsum_list={}
    
    recom_list=[]
    for sim, name in result:
       
        if sim<= 0: continue
        
        for tour in data[name]:
            simsum=0
            if tour =='type':continue
            if tour not in data[person]:
                
                score_dic.setdefault(tour,0)
                score_dic[tour]+=sim*data[name][tour][1]
                simsum_list.setdefault(tour,0)
                simsum_list[tour]+=sim
    
    cur.execute('select t_type2 from member where mem_id=(:k) ',k=person) #회원속성 불러오기
    t_type = cur.fetchone()
    
    for tour in score_dic:
        rate=score_dic[tour]/simsum_list[tour]
        
        
        cur.execute('select tour_address from tour_list where tour_name=(:k) ',k=tour) #여행지 위치 불러오기
        loca = cur.fetchone()
        
        if data[person]['type'][1]==t_type: 
            recom_list.append((rate*1.2,tour,loca[0])) #선호 여행지에대한 가중치 1.2 줌
        else :recom_list.append((rate,tour,loca[0]))
        
    recom_list.sort()
    recom_list.reverse()
         
    return(recom_list)           
                
print(getRecommendation(members,'k1',sim_pearson))    

            

