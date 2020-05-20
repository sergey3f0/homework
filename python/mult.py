def mult_table(n,m):
    s=" "*(len(str(n*m))+len(str(m))+len(str(n))+1)
    for i in range(1,n+1):
        s+=str(i)+" "*len(str(n*m))
    print(s)
    for j in range(1,m+1):
        s=" "
        for k in range(1,n+1):
            s+=str(j*k)+" "*((len(str(n*m)))-(len(str(j*k))))+" "
        print(" "*(len(str(m))-(len(str(j)))+1),j,s)
    

mult_table(int(input()),int(input()))