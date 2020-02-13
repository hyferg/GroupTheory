module Graphs (peace6j, pill, oneCasimir,
               twoCasimir, threeCasimir, fourCasimir) where
import GraphRecursive

{-
stockGraph :: (GraphRecursive g) => g -> Maybe g
stockGraph g = let
  eL = _  `freeEdgeLabelsOf_` g
  nL = _  `freeNodeLabelsOf_` g

  e = Edge (eL !! _)  [] _
  n = Node (nL !! _) []

  in return g >>= work [InsertE [], InsertN []]
-}

peace6j :: (GraphRecursive g) => g -> Maybe g
peace6j g = let
  eL = 6  `freeEdgeLabelsOf` g
  nL = 4  `freeNodeLabelsOf` g

  e13 = Edge (eL !! 0)  [n1,n3] D
  e32 = Edge (eL !! 1)  [n3,n2] D
  e21 = Edge (eL !! 2)  [n2,n1] D
  e01 = Edge (eL !! 3)  [n0,n1] G
  e03 = Edge (eL !! 4)  [n0,n3] G
  e02 = Edge (eL !! 5)  [n0,n2] G

  n0 = Node (nL !! 0) [e01,e03,e02]
  n1 = Node (nL !! 1) [e13,e01,e21]
  n3 = Node (nL !! 3) [e32,e03,e13]
  n2 = Node (nL !! 2) [e21,e02,e32]

  in return g >>= work [
  InsertN [
      n0,
      n1,
      n2,
      n3 ],
  InsertE [
      e13,
      e32,
      e21,
      e01,
      e03,
      e02 ]
  ]

twoCasimir :: (GraphRecursive g) => g -> Maybe g
twoCasimir g = let
  eL = 6  `freeEdgeLabelsOf` g
  nL = 4  `freeNodeLabelsOf` g

  n21n11 = Edge (eL !! 0)  [n21, n11] D
  n11n21 = Edge (eL !! 1)  [n11, n21] D
  n12n22 = Edge (eL !! 2)  [n12, n22] D
  n22n12 = Edge (eL !! 3)  [n22, n12] D
  n11n12 = Edge (eL !! 4)  [n11, n12] G
  n21n22 = Edge (eL !! 5)  [n21, n22] G

  n11 = Node (nL !! 0) [n11n21, n21n11, n11n12]
  n21 = Node (nL !! 1) [n21n11, n11n21, n21n22]
  n12 = Node (nL !! 2) [n11n12, n12n22, n22n12]
  n22 = Node (nL !! 3) [n21n22, n22n12, n12n22]

  in return g >>= work [
  InsertE [
      n21n11,
      n11n21,
      n12n22,
      n22n12,
      n11n12,
      n21n22],
    InsertN [
      n11,
      n21,
      n12,
      n22] ]

oneCasimir :: (GraphRecursive g) => g -> Maybe g
oneCasimir g = let
  eL = 3 `freeEdgeLabelsOf` g
  nL = 2  `freeNodeLabelsOf` g

  eg  = Edge (eL !! 0)  [n1, n2] G
  e11 = Edge (eL !! 1) [n1, n1] D
  e22 = Edge (eL !! 2) [n2, n2] D

  n1 = Node (nL !! 0) [e11, e11, eg]
  n2 = Node (nL !! 1) [eg, e22, e22]

  in return g >>= work [InsertN [n1, n2], InsertE [eg, e11, e22]]

fourCasimir :: (GraphRecursive g) => g -> Maybe g
fourCasimir g = let

  eL = 12 `freeEdgeLabelsOf` g
  nL = 8  `freeNodeLabelsOf` g

  n11 = Node (nL !! 0) [n41n11, n11n21, e1]
  n21 = Node (nL !! 1) [n11n21, n21n31, e2]
  n31 = Node (nL !! 2) [n21n31, n31n41, e3]
  n41 = Node (nL !! 3) [n31n41, n41n11, e4]

  n42 = Node (nL !! 7) [e4, n12n42, n42n32]
  n32 = Node (nL !! 6) [e3, n42n32, n32n22]
  n22 = Node (nL !! 5) [e2, n32n22, n22n12]
  n12 = Node (nL !! 4) [e1, n22n12, n12n42]

  n11n21 = Edge (eL !! 0) [n11,n21] D
  n21n31 = Edge (eL !! 1) [n21,n31] D
  n31n41 = Edge (eL !! 2) [n31,n41] D
  n41n11 = Edge (eL !! 3) [n41,n11] D

  n42n32 = Edge (eL !! 4) [n42,n32] D
  n32n22 = Edge (eL !! 5) [n32,n22] D
  n22n12 = Edge (eL !! 6) [n22,n12] D
  n12n42 = Edge (eL !! 7) [n12,n42] D

  e1 = Edge (eL !! 8) [n11, n12] G
  e2 = Edge (eL !! 9) [n21, n22] G
  e3 = Edge (eL !! 10) [n31, n32] G
  e4 = Edge (eL !! 11) [n41, n42] G

  in return g >>= work [
  InsertN [
  n11,
  n21,
  n31,
  n41,
  n42,
  n32,
  n22,
  n12
          ],
  InsertE [
  n11n21,
  n21n31,
  n31n41,
  n41n11,
  n42n32,
  n32n22,
  n22n12,
  n12n42,
  e1,
  e2,
  e3,
  e4
      ]]

pill :: (GraphRecursive g) => g -> Maybe g
pill g = let
  eL = 3 `freeEdgeLabelsOf` g
  nL = 2 `freeNodeLabelsOf` g

  eij = Edge (eL !! 0) [ni,nj] D
  eg  = Edge (eL !! 1) [ni,nj] G
  eji = Edge (eL !! 2) [nj,ni] D

  ni = Node (nL !! 0) [eg,eij,eji]
  nj = Node (nL !! 1) [eij,eg,eji]

  in return g >>= work [
  InsertN [ni, nj], InsertE [eij, eg, eji] ]

threeCasimir :: (GraphRecursive g) => g -> Maybe g
threeCasimir g = let

  eL = 100  `freeEdgeLabelsOf` g
  nL = 100  `freeNodeLabelsOf` g

  n11 = Node (nL !! 0) [n31n11, n11n21, e1]
  n21 = Node (nL !! 1) [n11n21, n21n31, e2]
  n31 = Node (nL !! 2) [n21n31, n31n11, e3]

  n32 = Node (nL !! 6) [e3, n12n32, n32n22]
  n22 = Node (nL !! 5) [e2, n32n22, n22n12]
  n12 = Node (nL !! 4) [e1, n22n12, n12n32]

  n11n21 = Edge (eL !! 0) [n11,n21] D
  n21n31 = Edge (eL !! 1) [n21,n31] D

  n32n22 = Edge (eL !! 2) [n32,n22] D
  n22n12 = Edge (eL !! 3) [n22,n12] D

  n12n32 = Edge (eL !! 4) [n12, n32] D
  n31n11 = Edge (eL !! 5) [n31, n11] D

  e1 = Edge (eL !! 8) [n11, n12] G
  e2 = Edge (eL !! 9) [n21, n22] G
  e3 = Edge (eL !! 10) [n31, n32] G

  in return g >>= work [
  InsertN [
  n11,
  n21,
  n31,
  n32,
  n22,
  n12
          ],
  InsertE [
  n11n21,
  n21n31,
  n32n22,
  n22n12,
  e1,
  e2,
  e3,
  n12n32,
  n31n11
      ]]

