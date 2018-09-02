FROM haskell:8
ADD darkroom.hs /darkroom.hs
RUN ghc --make darkroom.hs
CMD ./darkroom