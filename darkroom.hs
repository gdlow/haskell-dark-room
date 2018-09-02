import Control.Concurrent

dispatch_name :: [(String, IO ())]
dispatch_name =  [ ("1", yes_to_name)  
            , ("2", no_to_name)  
            , ("3", dolores_to_name)  
            ] 

dispatch_dark_room_start :: [(String, IO ())]
dispatch_dark_room_start =  [ ("1", go_north) ]

dispatch_start_again :: [(String, IO ())]
dispatch_start_again =  [ ("1", darkRoomStart)  
            , ("2", exit) 
            ]  
main = do
    -- Entrypoint to the game
    letterByLetter "YOU! What is your name?"
    name <- newEmptyMVar
    forkIO (do
        sleepInSeconds 10
        var <- tryTakeMVar name
        if var /= Nothing
            then return()
        else do
            letterByLetter "COME ON! Doesn't take that long to bloody answer!")
    line <- getLine
    putMVar name line
    letterByLetter "MUAHAHAHAHAHAHAHAHAHAHA!"
    letterByLetter "NO! I don't like that name."
    letterByLetter "You will be called..."
    letterByLetter "..."
    sleepInSeconds 1
    letterByLetter "DARREN!"
    letterByLetter "Do you like that name?"
    putStrLn "[1] YES!"
    putStrLn "[2] NO!"
    putStrLn "[3] I LIKED DOLORES"
    ans <- getLine
    let (Just action) = lookup ans dispatch_name
    action
    return()
--
-- First stage : Getting Darren's name
--
yes_to_name = do
    letterByLetter "Shut up Darren!"
    darkRoomStart
    return()
no_to_name = do
    letterByLetter "Shut up Darren!"
    darkRoomStart
    return()
dolores_to_name = do
    letterByLetter "DO-LO-RES? What are you, a hooker from 1950s America?"
    letterByLetter "Scraping enough diiirty mullah for a night of hot jazz and smack with some guy named Skip?"
    threadDelay 500000
    letterByLetter "AH-HAHAHAHA!"
    threadDelay 500000
    letterByLetter "Well..."
    letterByLetter "Daddy's got some bad news for you sister."
    letterByLetter "We don't like copped up giant bunnies around this part. Your name is not Dolores!"
    letterByLetter "Your name ..."
    letterByLetter "will be ..."
    sleepInSeconds 1
    letterByLetter "DARREN!"
    letterByLetter "Do you like that name?"
    putStrLn "[1] YES!"
    putStrLn "[2] NO!"
    putStrLn "[3] I LIKED DOLORES"
    ans <- getLine
    let (Just action) = lookup ans dispatch_name
    action
    return()
--
-- Second stage : Entrypoint to the game
--
darkRoomStart = do
    letterByLetter "YOU AWAKE TO FIND YOURSELF IN A DARK ROOM."
    letterByLetter "PICK AN OPTION."
    putStrLn "[1] GO NORTH"
    putStrLn "Other options will be available in the future :)"
    choices <- newEmptyMVar
    forkIO (do
        sleepInSeconds 4
        var <- tryTakeMVar choices
        if var /= Nothing
            then return()
        else do
            letterByLetter "ARGGGG..."
            sleepInSeconds 4
            var <- tryTakeMVar choices
            if var /= Nothing
                then return()
            else do
                letterByLetter "C-L-I-C-K. C-L-I-C-K. C-L-I-C-K.")
    ans <- getLine
    putMVar choices ans
    let (Just action) = lookup ans dispatch_dark_room_start
    action
    return()

go_north = do
    letterByLetter "YOU PROCEED in the direction YOU BELIEVE to be North."
    letterByLetter "HOW can you BE SURE, you're in a DARK ROOM."
    sleepInSeconds 1
    letterByLetter "OH?"
    letterByLetter "Oh of COURSE! You're a real man aren't you Darren?"
    letterByLetter "You're the type of person, who always knows where North is."
    letterByLetter "YEESSS Darren, and I respect that."
    letterByLetter "A man with balls so big, they own a pair of jeans on their own!"
    letterByLetter "And everytime you get an erection people think that you're smuggling a child."
    letterByLetter "Yess... Darren. You've got CONFIDENCE. And that CONFIDENCE means you procees briskly and directly -"
    letterByLetter "DIRECTLY NORTH and STRAIGHT into the high-end SPIKE in the wall in front of you."
    sleepInSeconds 1
    letterByLetter "You say hello to Mr. Spike, and it says hello to -"
    letterByLetter "..."
    sleepInSeconds 1
    letterByLetter "to Mr. Eye!"
    sleepInSeconds 1
    you_die
    return ()

--
-- Last stage : DEATH
--
you_die = do
    putStrLn "YOU DIE!!"
    threadDelay 500000
    putStrLn "YOU DIE!!"
    threadDelay 500000
    putStrLn "YOU DIE!!"
    threadDelay 500000
    putStrLn "YOU DIE!!"
    threadDelay 500000
    putStrLn "YOU DIE!!"
    threadDelay 500000
    putStrLn "YOU DIE!!!!"
    threadDelay 500000
    letterByLetter "HA-HA-HA-HAHAHAHAHAHAAAA"
    threadDelay 500000
    letterByLetter "*SNIFFS* Time passes down. Your body rots, and it hangs from the wall..."
    letterByLetter "Like a hobo's coat, in a charity shop."
    sleepInSeconds 1
    putStrLn "Would you like to play again?"
    putStrLn "[1] Start Over"
    putStrLn "[2] Exit"
    ans <- getLine
    let (Just action) = lookup ans dispatch_start_again
    action
    return()
exit = do
    return ()


sleepInSeconds n = threadDelay (n * 1000000)

letterByLetter :: [Char] -> IO ()
letterByLetter "" = do
    putStrLn ""
    return ()
letterByLetter (x:xs) = do
    putChar x
    threadDelay 50000
    letterByLetter xs