module Main where
import System

f::[Integer] -> Integer
f [] = 0
f a = (head a) + (f (tail a))

h::String -> Integer
h a = read a::Integer

main = do
av <- getArgs
if av /= []
 then do
  let a = (head (map h av))
  let b = ((map h av)!!1)
  print (f [a..b])
 else putStrLn "moo"

