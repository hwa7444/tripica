
# coding: utf-8

# #상관관계 - 두 변인 X,Y에 대해서 X가 변화할 때 Y가 변화하면 상관관계
# #인과관계 - X가 원인으로 Y가 결과가 될 때 인과관계

# In[1]:

import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
rc('font', family=font_name)
from math import sqrt


# In[69]:

members = {
    '차현석': {
        'type':['L','mus'],
        '비자림':['res',3.5],
        '솔트리':['res',2.0],
        '노리매':['amu',3.5],
        '오설록':['amu',1.5],
        '이중섭미술관':['art',3.8],
        '두모악':['art',3.5],
        '제주경마공원':['spo',4],
        '제주레일바이크':['spo',4.5],
        
    },
    '황해도': {
        'type':['V','nat'],
        '비자림':['res',4.5],
        '솔트리':['res',3.5],
        '노리매':['amu',3.5],
        '오설록':['amu',4.5],
        '이중섭미술관':['art',5],
        '두모악':['art',3.8],
        '넥슨컴퓨터박물관':['mus',4.1],
        '믿거나말거나박물관':['mus',3.7],
        '제주경마공원':['spo',4.3],
        '제주레일바이크':['spo',2.5],
        '제주목관아':['his',4.7],
        '제주추사관':['his',3.4],
        '만장굴':['nat',5],
        '용두암':['nat',5],
    },
    '김미희': {
        'type':['A','amu'],
        '비자림':['res',3.5],
        '솔트리':['res',4.0],
        '노리매':['amu',4.5],
        '오설록':['amu',2.5],
        '이중섭미술관':['art',4],
        '두모악':['art',4.5],
        '넥슨컴퓨터박물관':['mus',4.5],
        '믿거나말거나박물관':['mus',3],
        '제주경마공원':['spo',4.2],
        '제주레일바이크':['spo',4],
        '제주목관아':['his',3.9],
        '제주추사관':['his',4.3],
        '만장굴':['nat',5],
        '용두암':['nat',3.5],
    },
    '김준형': {
        'type':['A','spo'],
        '비자림':['res',4.5],
        '솔트리':['res',3],
        '노리매':['amu',4.1],
        '오설록':['amu',3.5],
        '이중섭미술관':['art',4.5],
        '두모악':['art',4],
        '넥슨컴퓨터박물관':['mus',2.5],
        '믿거나말거나박물관':['mus',3.8],
        '제주경마공원':['spo',4.3],
        '제주레일바이크':['spo',4.5],
        '제주목관아':['his',4.9],
        '제주추사관':['his',5],
        '만장굴':['nat',4.2],
        '용두암':['nat',3.8],
    },
    '이은비': {
         'type':['R','res'],
        '비자림':['res',3.5],
        '솔트리':['res',4.0],
        '노리매':['amu',4.5],
        '오설록':['amu',2.5],
        '이중섭미술관':['art',4],
        '두모악':['art',4.5],
        '넥슨컴퓨터박물관':['mus',4.5],
        '믿거나말거나박물관':['mus',3],
        '제주경마공원':['spo',4.2],
        '제주레일바이크':['spo',4],
        '제주목관아':['his',3.9],
        '제주추사관':['his',4.3],
        '만장굴':['nat',5],
        '용두암':['nat',3.5],
    },
    '임명진': {
        'type':['V','his'],
        '비자림':['res',2.5],
        '솔트리':['res',2.0],
        '노리매':['amu',3.5],
        '오설록':['amu',4.5],
        '이중섭미술관':['art',3.4],
        '두모악':['art',2.5],
        '넥슨컴퓨터박물관':['mus',3.5],
        '믿거나말거나박물관':['mus',4.3],
        '제주경마공원':['spo',4],
        '제주레일바이크':['spo',3.4],
        '제주목관아':['his',3.2],
        '제주추사관':['his',4.3],
        '만장굴':['nat',3],
        '용두암':['nat',2.5],
    },
    '심수정': {
         'type':['L','art'],
        '비자림':['res',3.5],
        '솔트리':['res',4.0],
        '노리매':['amu',4.5],
        '오설록':['amu',2.5],
        '이중섭미술관':['art',4],
        '두모악':['art',4.5],
        '넥슨컴퓨터박물관':['mus',4.5],
        '믿거나말거나박물관':['mus',3],
        '제주경마공원':['spo',4.2],
        '제주레일바이크':['spo',4],
        '제주목관아':['his',3.9],
        '제주추사관':['his',4.3],
        '만장굴':['nat',5],
        '용두암':['nat',3.5],
    },
    '박병관': {
        'type':['V','nat'],
        '비자림':['res',3.5],
        '솔트리':['res',4.0],
        '노리매':['amu',3.5],
        '두모악':['art',4.5],
        '넥슨컴퓨터박물관':['mus',3.5],
        '믿거나말거나박물관':['mus',3],
        '제주경마공원':['spo',3.2],
        '제주레일바이크':['spo',3],
        '제주목관아':['his',3.9],
        '제주추사관':['his',4.3],
    }
        
}


# In[41]:

k=members['박병관']['제주추사관'][1]
k


# # 피어슨상관계수

# In[53]:

def sim_pearson(data, person1, person2):
    sumX = 0;
    sumY = 0;
    sumPowX = 0;
    sumPowY = 0;
    sumXY= 0;
    
    tour_list=[]
   
    for i in data[person1]:
        if i =='type':continue
        if i in data[person2]:
            if i =='type':continue
            tour_list.append(i)
            
    if len(tour_list)==0 : return 0
    
    for x in tour_list:
        sumX+=data[person1][x][1]
        sumY+=data[person2][x][1]
        sumPowX+=pow(data[person1][x][1],2)
        sumPowY+=pow(data[person2][x][1],2)
        sumXY+=data[person1][x][1]*data[person2][x][1]
    
    coval = sumXY-sumX*sumY/len(tour_list)
    varX= sumPowX-pow(sumX,2)/len(tour_list)
    varY= sumPowY-pow(sumY,2)/len(tour_list)
    
    r=coval/sqrt(varX*varY)
    
    return r
   


# In[43]:

print(sim_pearson(members, '황해도', '임명진'))
print(sim_pearson(members, '심수정', '차현석'))


# In[54]:

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
        
    match_list.sort()
    match_list.reverse()
    return match_list[:n]


# In[47]:

pearson_list=top_match(members,'박병관',5,sim_pearson)


# In[48]:

pearson_list


# In[71]:

def getRecommendation(data, person,sim_funciton=sim_pearson):
    result = top_match(members,person,5,sim_pearson)
    score_dic={}
    simsum_list={}
    
    recom_list=[]
    for sim, name in result:
       
        if sim< 0: continue
        
        for tour in data[name]:
            simsum=0
            if tour =='type':continue
            if tour not in data[person]:
                
                score_dic.setdefault(tour,0)
                score_dic[tour]+=sim*data[name][tour][1]
                simsum_list.setdefault(tour,0)
                simsum_list[tour]+=sim
       
    for tour in score_dic:
        rate=score_dic[tour]/simsum_list[tour]
        if data[person]['type'][1]=='mus':
            recom_list.append((rate*1.2,tour)) #선호 여행지에대한 가중치 1.2 줌
        else :recom_list.append((rate,tour))
        
    recom_list.sort()
    recom_list.reverse()
         
    return(recom_list)           
                
print(getRecommendation(members, '차현석',sim_pearson))            

