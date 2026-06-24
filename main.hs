{-# OPTIONS_GHC -w #-}

import Data.List
import Prelude hiding (Right, Left)

import NewBoxRel hiding (main, eg_pcirs)
import qualified Cir2Tikz as CT
import Cir2Tikz (tikz_of_cir, tikz_of_rels, tikz_of_pcir, Circuit, PositionSpec (PositionSpec), Direction (Up , Down , Right , Left , LU , LD , RU , RD) )



your_cir = Cir [H 0, S 1, CX 0 1, CZ 1 3, X 2 , Z 3] (Spec "hello")



eg_rels = 
    [
    (Rel CT.Symplectic (Cir [CZ 0 1, D 1 "{0b}", D 0 "{0d}"] (Spec "")) (Cir [D 1 "{0b}", D 0 "{0d}", CZ 1 2] (Spec "")) (Spec "")),
    (Rel CT.Symplectic (Cir [CZ 0 1, D 1 "{ab}", D 0 "{0d}"] (Spec "")) (Cir [D 1 "{ab}", D 0 "{0,d-a}", Sep, He 2 "3", CZ 1 2, H 2] (Spec "")) (Spec "$a\\neq 0$")),
    (Rel CT.Symplectic (Cir [CZ 0 1, D 1 "{0b}", D 0 "{cd}"] (Spec "")) (Cir [D 1 "{0,b-c}", D 0 "{c,d}" ,He 1 "3", CZ 1 2, H 1] (Spec "")) (Spec "$c\\neq 0$")),
    (Rel CT.Symplectic (Cir [CZ 0 1, D 1 "{ab}", D 0 "{cd}"] (Spec "")) (Cir [D 1 "{a,b-c}", D 0 "{c,d-a}", Sep, He 1 "3", Se 1 "-a/c", He 2 "3", Se 2 "-c/a", CZ 1 2, H 2, H 1] (Spec "")) (Spec "$a,c\\neq 0$"))
    ]


eg_pcirs :: [(Cir , PositionSpec)]
eg_pcirs =
  [
    (Cir eg1 (Spec "eg1") , PositionSpec Up "\\Rightarrow"),
    (Cir eg2 (Spec "eg2") , PositionSpec Right "\\mapsto"),
    (Cir eg1 (Spec "eg1 again") , PositionSpec RU "\\rightarrow"),
    (Cir eg2 (Spec "eg2 again") , PositionSpec RU "\\rightarrow")
  ]


main = do
    putStrLn $ tikz_of_cir $ cir_trans $ your_cir
    
main_rels = do
    putStrLn $ tikz_of_rels $ map rel_trans $ eg_rels
    
main_pcir = do
    putStrLn $ tikz_of_pcir $ map pcir_trans $ eg_pcirs  
    