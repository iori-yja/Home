module Main where
import System

{-
 - xxx num of lives f
 - x!o     ;        f
 - ooo     ;        f
 -        sum    nextgen
 -}
nextgen::[[Bool]]->Int
nextgen [] = 0
nextgen a = (f (head a))+(nextgen (tail a))
 where
  f [] = 0
  f a  = if (head a)==True then
   1+(f (tail a))
  else
   (f (tail a))

-- lives around on map
env::[[Bool]]->[Int]->[[Bool]]
env g a =
 (la(g!!((a!!1)-1)) (a!!0)):(la(g!!( a!!1)  )  (a!!0)):(la(g!!((a!!1)+1)) (a!!0)):[]
 where  
  la [] _ =[]
  la x a = (x!!(a-1)):(x!!a):(x!!(a+1)):[]

--ignore center creature
igal::[[Bool]]->[[Bool]]
igal a =
 (a!!0):((\a -> (a!!0):False:(a!!2):[])(a!!1)):(a!!2):[]
 
--when a pixel given, Consider whether it is in next time
pix::[[Bool]]->[Int]->Bool
pix a b = if ((a!!(b!!1))!!(b!!0)) then
 (\a ->
  if a <= 1 then False
   else if a <=3 then True
    else False)(nextgen (igal (env a b)))
 else
  (\a ->
   if a ==3 then True
    else False)(nextgen (env a b))

xloop::[[Bool]]->[Int]->[Bool]
xloop _ [7,_] = []
xloop a b =
 (pix a b):(xloop a (((head b)+1):(b!!1):[]))

yloop::[[Bool]]->Int->[[Bool]]
yloop a 7 = []
yloop a b =
 (xloop a (1:b:[])):(yloop a (b+1))

printxy []=return 0
printxy a=do
 print (head a)
 printxy (tail a)

--append false left and right
apnd::[[Bool]]->[[Bool]]
apnd []=[]
apnd a = (False:(head a) ++ [False]):(apnd (tail a))
{-
getmap =do
 s <- getLine
 if s == [] then return []
  else return (read s::[Bool]):getmap
-}
main = do
 s <- getLine
 let g = (read s::[[Bool]])
 -- let g = [[False,True,False,True,False,False],[True,True,False,False,True,False],[False,False,False,True,False,False],[True,False,True,True,False,False],[True,True,False,True,False,True],[False,True,False,True,True,True]]
 --
 --
 --[[False,True, False,True, False,False],^
 -- [True, True, False,False,True, False],x
 -- [False,False,False,True, False,False]]_
 -- [True, False,True, True, False,False] 
 -- [True, True, False,True, False,True]
 -- [False,True, False,True, True, True]]
 -- <=========y==========>
 --
 -- bind False top and bottom
 printxy g
 putStrLn "==================================="
 let k = ([False,False,False,False,False,False]:g) ++ [[False,False,False,False,False,False]]
 printxy (yloop (apnd k) 1)

