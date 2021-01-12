{-# LANGUAGE NamedFieldPuns #-}

module Lib where

import Data.Text.Lazy (Text, unpack)
import GHC.IO.Handle (Handle)
import System.Exit (ExitCode)
import System.Process
  ( StdStream (Inherit, UseHandle),
    cleanupProcess,
    createProcess,
    shell,
    std_out,
    waitForProcess,
  )

newtype Config = Config {stdout :: Maybe Handle} deriving (Show)

runBashCommand :: Config -> Text -> IO ExitCode
runBashCommand config bashCommand = do
  putStrLn $ "Running bash command with config: " <> show config
  let Config {stdout} = config
      process =
        (shell (unpack bashCommand))
          { std_out = maybe Inherit UseHandle stdout
          }
  (maybeStdinHandler, maybeStdoutHandler, maybeStderrHandler, processHandle) <- createProcess process
  exitCode <- waitForProcess processHandle
  cleanupProcess (maybeStdinHandler, maybeStdoutHandler, maybeStderrHandler, processHandle)
  putStrLn $ "Executed bash command, got exit code " <> show exitCode
  return exitCode
