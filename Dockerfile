FROM haskell:8
ADD darkroom.hs /darkroom.hs
CMD runhaskell darkroom.hs