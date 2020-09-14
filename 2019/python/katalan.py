def katalan(x):
    if(x==0):
       return 1
    else:
        i=0
        for j in range(0,x):
            i+=(katalan(j))*(katalan(x-1-j))
        return i
for i in range(0,15):
    print(katalan(i))