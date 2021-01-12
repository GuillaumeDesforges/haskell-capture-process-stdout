{-# LANGUAGE OverloadedStrings #-}

import Lib
import System.Exit
import System.IO.Silently
import System.Process
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "run a bash" $ do
    it "works and writes to handle" $ do
      (readEnd, writeEnd) <- createPipe
      let config = Config {stdout = Just writeEnd}
      (stdoutCapture, result) <- hCapture [readEnd] $ runBashCommand config "echo 'Hello world!'"
      result `shouldBe` ExitSuccess
      stdoutCapture `shouldBe` "Hello world!"