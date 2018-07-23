
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from scipy.spatial import distance


data = pd.read_csv('cluster.csv', header = 0)
x=data.ix[:,:].values

x = StandardScaler().fit_transform(x)   ### standardizing the data for PCA

pca = PCA(n_components=2, whiten=True)
principalComponents = pca.fit_transform(x)  ### apply pca to data

x=principalComponents

m={}
classes={}

def k_means_cluster(k):     ## k means function
    for i in range(0,k):
        m[i]=x[i]
    max_cluster=300
    tolarence=0.001
    
    for i in range(max_cluster):
        for i in range(k):
            classes[i]=[]
            
        for features in x:
            distances=[np.linalg.norm(features - m[mi]) for mi in m]
            classification = distances.index(min(distances))
            classes[classification].append(features)
        
        prev_m = dict(m)
        
        for classification in classes:
            m[classification] = np.average(classes[classification],axis=0)
    
        optimized = True
        
        
        for c in m:
            original_m = prev_m[c]
            current_m = m[c]
            if np.sum((current_m-original_m)/original_m*100.0) > tolarence:
                optimized = False
    
        if optimized:
            break
        
             
    ## Plot the clusters
    colors = 10*["b", "g", "darkcyan","k" ,"darkgrey", "r","y","m","sandybrown","pink","lime"]

    for classification in classes:
    	color = colors[classification]
    	for features in classes[classification]:
    		plt.scatter(features[0], features[1], color = color,s = 30)
    	
    plt.show() 
    ###     Calculating the SSE(sum of squared error)
    j=0
    total=0
    for centroid in m:
        #print(m[j])
        for i in range(0,len(classes[j])):
            #total=total+np.linalg.norm(centroid,classes[j][i])*np.linalg.norm(centroid,classes[j][i])
            total=total+distance.euclidean(m[j],classes[j][i])*distance.euclidean(m[j],classes[j][i])
        j+=1
    print("SSE value for k =",k," ",total)
    
 ## k means for different values of k

k_means_cluster(1)

k_means_cluster(5)

k_means_cluster(10)

k_means_cluster(20)



    
    