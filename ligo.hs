h=head;i=tail;n []=0;n a=(g(h a))+(n(i a));l[] _=[];l x a=(x!!(a-1)):(x!!a):(x!!(a+1)):[];g []=0;g a=if(h a)then 1+(g(i a))else(g(i a));t=True;f=False
v g a=(l(g!!((a!!1)-1))(a!!0)):(l(g!!(a!!1))(a!!0)):(l(g!!((a!!1)+1))(a!!0)):[]
j a=(a!!0):((\a->(a!!0):f:(a!!2):[])(a!!1)):(a!!2):[]
q a b=if((a!!(b!!1))!!(b!!0))then(\a->if a<=1then f else if a<=3then t else f)(n(j(v a b)))else(\a->if a==3then t else f)(n(v a b))
x _ [7,_]=[]
x a b=(q a b):(x a(((h b)+1):(b!!1):[]))
y a 7=[]
y a b=(x a (1:b:[])):(y a(b+1))
z []=return 0
z a=print(h a)>>z(i a)
d []=[]
d a=(f:(h a)++[f]):(d(i a))
main=getLine>>=(\s->z(y(d([f,f,f,f,f,f]:(read s::[[Bool]])++[[f,f,f,f,f,f]]))1))
