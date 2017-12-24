module Lib
    ( sysName
    , someFunc
    ) where

import Bindings.Uname

import Foreign.C
import Foreign.Marshal

sysName :: IO String
sysName = alloca $ \ ptr ->
          do throwErrnoIfMinus1_ "uname" $ uname ptr
             peekCString $ sysname ptr

someFunc :: IO ()
someFunc = putStrLn =<< sysName
