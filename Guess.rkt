;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname guess) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t quasiquote repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;
;;***************************************************
;;   Shonn Li 
;;   guess
;;   A program where a data base with name and
;;   characteristics are given to see which characteristics
;;   matches which name (built with racket)

;;   the data will be given in a format of listof list
;;   and the first value from each list is a name
;;   followed with characteristics afterward
;;   the name and characteristics will be symbols
;;***************************************************
;;


(require "animals.rkt")


;; Data Definition

;; An Example is a (cons Sym (listof Sym))
;; Requires: each attribute in the rest is unique

;; A Histogram is a (listof (list Sym Nat))
;; Requires: A symbol can appear in only one pair.

;; An Augmented Histogram (AH) is a (listof (list Sym Nat Nat))
;; Requires: A symbol can appear in only one triple.

;; An Entropy Association List (EAL) is a (listof (list Sym Num))
;; Requires: A symbol can appear in only one pair.

;; A Decision Tree (DT) is one of:
;; * Bool
;; * (list Sym DT DT)


;; Constants:
(define seen
  (list
   (list 'squirrel 'small 'angry)
   (list 'goose 'large 'swims 'flies 'angry)
   (list 'goose 'large 'swims 'flies 'angry)
   (list 'crow 'medium 'flies 'angry)))

;; Gobal Helper function

;; Used in collect-attribute and split-examples
;; (sym=? sym lst) Produces new list with all of attributes
;;    contained in the lst that is same as sym.
;; Examples:
(check-expect (sym=? 'hi '(hi hi hello)) '(hi hi)) 
(check-expect (sym=? 'hi '(ho ho ho)) empty)

;; sym=?: Symbol Example -> Example
(define (sym=? sym lst)
  (local [(define (f x) (symbol=? sym x))]
    (filter f lst)))


;;
;; Part a
;;


;; (collect-attributes examples) Produces a list of attributes
;;    contained in the examples with no duplicates. 
;; Examples:
(check-expect (collect-attributes seen)
              (list 'medium 'flies 'swims 'large 'angry 'small))
(check-expect (collect-attributes empty)
              empty)

;; collect-attribute: (listof Example) -> Example
(define (collect-attributes examples)
  (local [;; (collect-attributes-h examples lst) Produces a new 
          ;;    list with all of attributes contained in the
          ;;    examples added to lst with no duplicates.
          ;; collect-attribute-h: (listof Example) Example -> Example
          (define (collect-attributes-h examples lst)
            (cond [(empty? examples) lst]
                  [else (collect-attributes-h (rest examples)
                        (unique-attribute (rest (first examples)) lst))]))

          ;; (unique-attribute example lst) Produces new list 
          ;;    with all of attributes contained in the example
          ;;    added to lst with no duplicates.
          ;; unique-attribute: Example Example -> Example
          (define (unique-attribute example lst)
            (cond [(empty? example) lst]
                  [(empty? (sym=? (first example) lst))
                   (unique-attribute (rest example)
                                     (cons (first example) lst))]
                  [else (unique-attribute (rest example) lst)]))]
    (collect-attributes-h examples empty)))
                  
;; Tests:
;; empty
(check-expect (collect-attributes empty)
              empty)
;; some duplicates
(check-expect (collect-attributes
               '((goose large swims flies) (goose large swims flies angry)
                 (squirrel small angry))) '(small angry flies swims large))
(check-expect (collect-attributes
               '((goose large swims flies) (goose large swims flies angry)))
              '(angry flies swims large))
;; no attributes
(check-expect (collect-attributes
               '((goose) (goose) (goose) (goose)))
              '())
(check-expect (collect-attributes
               '((goose) (duck) (bear) (geese)))
              '())
;; no duplicates
(check-expect (collect-attributes
               '((goose large swims flies) (goose angry)))
              '(angry flies swims large))


;;
;; Part b
;;


;; (split-examples examples symbol) Produces a new list 
;;    the contains two list of examples where one have list
;;    of examples that contains symbol and the other don't.
;; Examples:
(check-expect
 (split-examples seen 'goose)
 '(((goose large swims flies angry) (goose large swims flies angry))
   ((crow medium flies angry) (squirrel small angry))))
(check-expect
 (split-examples seen 'small) '(((squirrel small angry))
                                ((crow medium flies angry)
                                 (goose large swims flies angry)
                                 (goose large swims flies angry))))


;; split-examples: (listof Example) Symbol -> 
;;    (listof (listof Example) (listof Example))
(define (split-examples examples symbol)
  (local [;; (split-examples-h examples lst1 lst2) Produces a new list 
          ;;    the contains lst1 lst2 where lst1 have list of examples
          ;;    that contains symbol and the lst2 don't.
          ;; split-examples-h: (listof Example) (listof Example)
          ;;    (listof Example) -> (listof (listof Example) (listof Example))
          (define (split-examples-h examples lst1 lst2)
            (cond [(empty? examples) (list lst1 lst2)]
                  [(empty? (sym=? symbol (first examples)))
                   (split-examples-h (rest examples) lst1
                                     (cons (first examples) lst2))]
                  [else (split-examples-h (rest examples) 
                                     (cons (first examples) lst1) lst2)]))]
    (split-examples-h examples empty empty)))

;; Tests:
;; empty
(check-expect (split-examples empty 'lol) '(()()))
;; some contains some not (name and attribute test)
(check-expect (split-examples 
               '((goose large swims flies) (goose large swims flies angry)
                 (squirrel small angry)) 'goose)
              '(((goose large swims flies angry) (goose large swims flies))
                ((squirrel small angry))))
(check-expect (split-examples 
               '((goose large swims flies) (goose large swims flies angry)
                 (squirrel small angry)) 'large)
              '(((goose large swims flies angry) (goose large swims flies))
                ((squirrel small angry))))
;; no contains
(check-expect (split-examples
               '((goose) (goose) (goose) (goose)) 'small)
              '(() ((goose) (goose) (goose) (goose))))
(check-expect (split-examples
               '((goose big) (goose big) (goose big) (goose big)) 'small)
              '(() ((goose big) (goose big) (goose big) (goose big))))
(check-expect (split-examples
               '((goose) (duck) (bear) (geese)) 'small)
              '(() ((geese) (bear) (duck) (goose))))
;; all contains (name and attribute test)
(check-expect (split-examples '((goose large swims flies)
                                (goose large swims flies angry)) 'flies)
              '(((goose large swims flies angry) (goose large swims flies)) ()))
(check-expect (split-examples '((goose large swims flies)
                                (goose large swims flies angry)) 'goose)
              '(((goose large swims flies angry) (goose large swims flies)) ()))


;;
;; Part c
;;


;; Constants
(define r1 '((squirrel small angry) (crow small flies angry)
            (goose large swims flies angry) (squirrel small swims angry)
            (sparrow small flies) (gull medium swims flies angry)
            (duck medium swims flies) (crow small flies)
            (duck small swims flies angry) (gull small flies angry)))
(define r2'((squirrel small angry)
            (squirrel small flies angry)
            (sparrow small flies angry) (goose small swims flies angry)
            (crow medium flies angry) (gull medium swims flies angry)
            (crow large flies angry) (duck small swims flies)
            (duck large swims flies) (sparrow small flies)
            (duck small swims flies) (squirrel small swims angry)
            (squirrel medium angry) (sparrow small flies)
            (squirrel small angry) (squirrel small angry)
            (goose large swims flies angry) (gull medium swims angry)
            (sparrow small flies) (crow large flies angry)))


;; (histogram examples) Produces a list of attribute/count pairs,
;;    with each pair indicating how many times that attribute
;;    appears in the examples.
;; Examples:
(check-expect (histogram seen)
              (list
               (list 'small 1) (list 'angry 4) (list 'large 2)
               (list 'swims 2) (list 'flies 3) (list 'medium 1)))
(check-expect (histogram r1)
              '((small 7) (angry 7) (flies 8)
                          (large 1) (swims 5) (medium 2)))

;; histogram: (listof Example) -> Histogram
(define (histogram examples)
  (local [;; (histogram-h all-tri lst) Produces a list of attribute/count
          ;;    pairs that is cons onto lst, with the attribute from an
          ;;    attribute in all-tri and count all times of its appearance
          ;;    in examples.
          ;; histogram-h: Example Histogram -> Histogram
          (define (histogram-h all-tri lst)
            (cond [(empty? all-tri) lst]
                  [else (histogram-h
                         (rest all-tri)
                         (cons (attributes (first all-tri)) lst))]))
          
          ;; (attributes sym) Produces the sym and the  
          ;;    number of time it shows up in examples.
          ;; attributes: Sym -> (list Sym Nat)
          (define (attributes sym)
            (list sym (length (first (split-examples examples sym)))))]
    (histogram-h (collect-attributes examples) empty)))

;; Tests:
;; empty
(check-expect (histogram empty) empty)
;; no double
(check-expect (histogram '((squirrel small angry))) '((small 1)(angry 1)))
(check-expect (histogram '((squirrel small angry) (goose big fat)))
              '((small 1) (angry 1) (big 1) (fat 1)))
;; duplicates
(check-expect (histogram seen)
              (list (list 'small 1) (list 'angry 4) (list 'large 2)
                    (list 'swims 2) (list 'flies 3) (list 'medium 1)))
(check-expect (histogram r2)  '((small 12) (angry 14) (flies 14)
                                           (swims 8) (medium 4) (large 4)))
;; no attributes
(check-expect (histogram '((goose) (duck) (bear) (geese))) empty)


;;
;; Part d
;;


;; (augment-histogram histogram attributes total) Produces a new AH with 
;;   each (list Sym Nat Nat) having the sym from histogram or attributes 
;;   and the second Nat from total minus previous number from histogram. 
;; Examples:
(check-expect (augment-histogram
               (list (list 'a 100) (list 'c 50)) (list 'a 'b 'c) 200)
              (list (list 'a 100 100) (list 'b 0 200) (list 'c 50 150)))
(check-expect (augment-histogram empty (list 'x 'y) 10)
              (list (list 'x 0 10) (list 'y 0 10)))

;; augment-histogram: Histogram (listof Sym) Nat -> AH
;; Requires:
;;    Sym in attributes are in Histogram
;;    total >= any number in histogram
(define (augment-histogram histogram attributes total)
  (local
    [;; (augment-histogram-h hist attr lst) Produces  
     ;;   a new AH with each (list Sym Nat Nat) having the sym  
     ;;   from histogram or attribute and the second Nat from 
     ;;   total minus number from histogram. All (list Sym Nat Nat)
     ;;   are cons onto the lst to make an AH.
     ;; augment-histogram-h: Histogram (listof Sym) AH -> AH
     (define (augment-histogram-h hist attr lst)
       (cond [(empty? attr) lst]
             [(empty? hist)
              (augment-histogram-h
               hist (rest attr) 
               (cons (list (first attr) 0 total) lst))]
             [(not (empty? (filter
                            (lambda (item) (symbol=? (first item) (first attr)))
                            histogram)))
              (local
                [(define histo (filter (lambda (item)
                                         (symbol=? (first item)
                                                   (first attr))) histogram))
                 (define hista
                   (filter (lambda (item)
                             (not (symbol=? (first item) (first attr))))
                           histogram))]
                (augment-histogram-h
                 hista (rest attr)
                 (cons (list (first attr) (second (first histo))
                             (- total (second (first histo)))) lst)))]
             [else (augment-histogram-h
                    hist (rest attr) 
                    (cons (list (first attr) 0 total) lst))]))
          
     ;; (my-reverse lst lst2) Produces a new list that is
     ;;    reversed in order from lst by cons them onto lst2.
     ;; my-reverse: (listof X) (listof X) -> (listof X)
     (define (my-reverse lst lst2)
       (cond [(empty? lst) lst2]
             [else (my-reverse
                    (rest lst) (cons (first lst) lst2))]))]
    (my-reverse (augment-histogram-h histogram attributes empty) empty)))


;; Tests:
;; empty
(check-expect (augment-histogram empty empty 0) empty)
(check-expect (augment-histogram empty (list 'x 'y) 10)
              (list (list 'x 0 10) (list 'y 0 10)))
;; histogram = attributes
(check-expect (augment-histogram
               '((small 1) (angry 4) (large 2) (swims 2) (flies 3) (medium 1))
               '(small angry large swims flies medium) 4)
              '((small 1 3) (angry 4 0) (large 2 2)
                            (swims 2 2) (flies 3 1) (medium 1 3)))
;; histogram < attributes
;; tail
(check-expect (augment-histogram
               '((small 1) (angry 4) (large 2) (swims 2) (flies 3) (medium 1))
               '(small angry large swims flies medium attack on titan) 4)
              '((small 1 3) (angry 4 0) (large 2 2)
                            (swims 2 2) (flies 3 1) (medium 1 3) (attack 0 4)
                            (on 0 4) (titan 0 4)))
;; front middle tail
(check-expect (augment-histogram
               '((small 1) (angry 4) (large 2) (swims 2) (flies 3) (medium 1))
               '(attack small angry large on swims flies medium titan) 4)
              '((attack 0 4) (small 1 3) (angry 4 0) (large 2 2) (on 0 4)
                             (swims 2 2) (flies 3 1) (medium 1 3) (titan 0 4)))
;; middle
(check-expect (augment-histogram
               '((small 1) (angry 4) (large 2) (swims 2) (flies 3) (medium 1))
               '(small angry large attack on titan swims flies medium) 4)
              '((small 1 3) (angry 4 0) (large 2 2) (attack 0 4) (on 0 4)
                             (titan 0 4) (swims 2 2) (flies 3 1) (medium 1 3)))
;; front
(check-expect (augment-histogram
               '((small 1) (angry 4) (large 2) (swims 2) (flies 3) (medium 1))
               '(attack on titan small angry large swims flies medium) 4)
              '((attack 0 4) (on 0 4) (titan 0 4) (small 1 3) (angry 4 0)
                             (large 2 2)  (swims 2 2) (flies 3 1) (medium 1 3)))


;;
;; Part e
;;


;; (entropy positive-counts negative-counts) Produces the entropy of
;;    positive-counts and negative-counts chosen from an AH. 
;; Examples:
(check-within (entropy (list 'large 126 59) (list 'large 146 669))
              #i0.5663948489858 0.001)
(check-within (entropy (list 'small 17 168) (list 'small 454 361))
              #i0.5825593868115 0.001)
(check-within (entropy (list 'a 0 100) (list 'b 100 0)) 0.0 0.001)

;; entropy: (list Sym Nat Nat) (list Sym Nat Nat) -> Num
(define (entropy positive-counts negative-counts)
  (local [;; (entropy-h a b c d ab cd) Produces the entropy of
          ;;    a b c d ab cd using the entropy equation. 
          ;; entropy-h: Nat Nat Nat Nat Nat Nat -> Num
          (define (entropy-h a b c d ab cd)
            (+ (* (P-n-m ab (+ ab cd))
                     (+ (e-p (P-n-m a ab)) (e-p (P-n-m b ab))))
                  (* (P-n-m cd (+ ab cd)) (+ (e-p (P-n-m c cd))
                                             (e-p (P-n-m d cd))))))

          ;; (e-p p) Produces the probability for p
          ;;    using the e(p) equation given. 
          ;; e-p: Nat -> Num
          ;; Requires:
          ;;    0 <= p <= 1
          (define (e-p p)
            (cond [(zero? p) 0]
                  [else (- (* p (log p 2)))]))
          
          ;; (P-n-m n t) Produces the probability for 
          ;;   n m using t the sum of n m and n.
          ;; P-n-m: Nat Nat -> Num
          ;; Requires:
          ;;   0 <= m, 0 <= n
          (define (P-n-m n t)
            (cond [(zero? t) 0.5]
                  [else (/ n t)]))]
    (entropy-h (second positive-counts) (second negative-counts)
               (third positive-counts) (third negative-counts)
               (+ (second positive-counts) (second negative-counts))
               (+ (third positive-counts) (third negative-counts)))))

;; Tests:
(check-within (entropy (list 'a 0 0) (list 'b 0 0)) 1.0 0.001)


;;
;; Part f
;;


;; (entropy-attributes positive negative) Produces a list 
;;    of attribute/entropy pairs by computing the entropy
;;    of each attribute in positive and negative.
;; Example:
(check-within
 (entropy-attributes
  (list
   (list 'large 126 59) (list 'angry 161 24)
   (list 'small 17 168) (list 'flies 170 15)
   (list 'swims 162 23) (list 'medium 42 143))
  (list
   (list 'large 146 669) (list 'angry 469 346)
   (list 'small 454 361) (list 'flies 615 200)
   (list 'swims 365 450) (list 'medium 215 600)))
 (list
  (list 'large #i0.5663948489858) (list 'angry #i0.6447688190492)
  (list 'small #i0.5825593868115) (list 'flies #i0.6702490498564)
  (list 'swims #i0.6017998773730) (list 'medium #i0.6901071708677)) 0.001)

;; entropy-attributes: AH AH -> EAL
;; Requires:
;;    positive and negative have equal list length
;;    each attribute Sym must be in both
;;    AH and in same order.
(define (entropy-attributes positive negative)
  (cond [(empty? positive) empty]
        [else (cons (list (first (first positive))
                          (entropy (first positive) (first negative)))
                    (entropy-attributes (rest positive) (rest negative)))]))

;;
;; Part g
;;



;; (best-attribute entropies) Produces the attribute with the minimum 
;;    entropy or any such attribute with the attribute from entropies. 
;; Examples:
(check-expect
 (best-attribute
  (list (list 'large #i0.5663948489858) (list 'angry #i0.6447688190492)
        (list 'small #i0.5825593868115) (list 'flies #i0.6702490498564)
        (list 'swims #i0.6017998773730) (list 'medium #i0.6901071708677)))
 'large)
(check-expect (best-attribute (list (list 'large #i0.5663948489858))) 'large)

;; best-attribute: (ne-listof (list X Num)) -> X
(define (best-attribute entropies)
  (local [;; (a-min-lst n-lst) Produces the minimum num in the n-lst.  
          ;; a-min-lst: (listof (list Any Num)) -> Num
          (define (a-min-lst n-lst)
            (cond ;[(empty? n-lst)'error]
                  [(empty? (rest n-lst))
                   (second (first n-lst))]
                  [else (min (second (first n-lst))
                             (a-min-lst (rest n-lst)))]))
          (define e-min (a-min-lst entropies))
          ;; (ba-h entropies) Produces the attirbute with the 
          ;;    minimum  entropy or any such attribute with
          ;;    the attribute with the attribute from entropies. 
          (define (ba-h entropies) 
            (cond [(= e-min (second (first entropies)))
                   (first (first entropies))]
                  [else (ba-h (rest entropies))]))]
    (ba-h entropies)))

;; Tests
;; Single attribute
(check-expect (best-attribute (list (list 'large #i0.5663948489858))) 'large)
;; Same value attribute
(check-expect (best-attribute (list (list 'small #i0.5663948489858)
                                    (list 'large #i0.5663948489858))) 'small)
;; different value attribute
(check-expect (best-attribute (list (list 'small #i0.5435446843354)
                                    (list 'large #i0.5663948489858)
                                    (list 'flies #i0.1658897351357))) 'flies)


;;
;; Part h
;;


;; (build-dt examples label) Produces a DT by using
;;    examples and label to build DT's characteristic. 
;; Examples:
(check-expect (build-dt (random-animals 1000) 'emu) false)


;; build-dt: (listof Example) Sym -> DT
(define (build-dt examples label)
  (local [(define total (length examples))
          (define col-a (collect-attributes examples))
          (define split-label (split-examples examples label))
          (define with-label (first split-label))
          (define no-label (second split-label))]  
    (cond [(empty? with-label) false]
          [(empty? no-label) true]
          [(empty? col-a)
           (> (length with-label) (length no-label))]
          [else
           (local
             [(define root-a
                (best-attribute
                 (entropy-attributes
                  (augment-histogram (histogram with-label) col-a total)
                  (augment-histogram (histogram no-label) col-a total))))
              (define split-root (split-examples examples root-a))
              ;; (my-remove examples sym) Removes all the sym in examples
              ;; my-remove: (listof Examples) Sym -> (listof Examples)
              (define (my-remove examples sym)
                (cond [(empty? examples) empty]
                      [else (cons (filter (lambda (item)
                                            (not (symbol=? item sym)))
                                          (first examples))
                                  (my-remove (rest examples) sym))]))
              (define remove-root-left (my-remove (first split-root) root-a))
              (define remove-root-right (second split-root))]
             (cond [(equal? remove-root-left remove-root-right)
                    (build-dt remove-root-left label)]
                   [else (list root-a (build-dt remove-root-left label)
                               (build-dt remove-root-right label))]))])))


;;
;; Part i
;;

;; (train-classifier examples label) Produces a function that checks whether
;;    some list of attributes satisfies the attributes of label using examples. 
;; Examples:
(check-expect (mikasa? '(good foolish)) true)
(check-expect (mikasa? '(good foolish weak)) false)

;; train-classifier: (listof Examples) Sym -> ((listof Sym) -> Bool)
(define (train-classifier examples label)
  (local
    [(define dt (build-dt examples label))
     (define (what? x)
       (local
         [(define (what-h? dt x)
            (cond [(boolean? dt) dt]
                  [(not (empty?
                         (filter (lambda (item)
                                   (symbol=? item (first dt))) x)))
                   (what-h? (second dt)
                            (filter (lambda (item)
                                      (not (symbol=? item (first dt)))) x))]
                  [else (what-h? (third dt) x)]))]
         (what-h? dt x)))]
    what?))

;; Constants:
(define goose? (train-classifier (random-animals 1000) 'goose))
(define squirrel? (train-classifier (random-animals 1000) 'squirrel))
(define crow? (train-classifier (random-animals 1000) 'crow))
(define attack-on-titan
  '((Eren main-character poor smart strong)
    (Mikasa main-character good foolish strong)
    (Armin main-character good smart weak)
    (Jean main-character good foolish weak)))
(define eren? (train-classifier attack-on-titan 'Eren))
(define mikasa? (train-classifier attack-on-titan 'Mikasa))

;; Tests:
(check-expect (eren? '(good smart)) false)
(check-expect (eren? '(poor smart)) true)
(check-expect (goose? (list 'large 'angry 'flies 'swims)) true)
(check-expect (goose? (list 'small 'angry)) false)
(check-expect (squirrel? (list 'large 'angry 'flies 'swims)) false)
(check-expect (squirrel? (list 'small 'angry)) true)
(check-expect (crow? (list 'angry 'flies 'medium)) true)


;;
;; Bonus
;;


;; Constants
(define emu? (train-classifier (random-animals 1000) 'emu))
(define eren '((Eren main-character poor smart strong)))

;; (performance classifier? examples label) Produces a sensitivity and
;;    specificity for the classier? on the example using examples and label. 
;; Examples:
(check-within (second (performance squirrel? (random-animals 1000) 'squirrel))
              70 20)
(check-within (second (performance goose? (random-animals 1000) 'goose))
              70 20)

;; performance: (listof Sym -> Bool) (listof Examples) Sym -> (list Sym Nat Nat)
(define (performance classifier? examples label)
  (local [(define (p-h classifier? examples pos pos-total neg neg-total)
            (cond [(empty? examples)
                   (cond [(and (zero? pos-total) (zero? neg-total))
                          (list label 0 0)]
                         [(zero? pos-total)
                          (list label 0 (round (* (/ neg neg-total) 100)))]
                         [(zero? neg-total)
                          (list label (round (* (/ pos pos-total) 100)) 0)]
                         [else (list label (round (* (/ pos pos-total) 100))
                                     (round (* (/ neg neg-total) 100)))])]
                  [(symbol=? label (first (first examples)))
                   (cond [(classifier? (rest (first examples)))
                          (p-h classifier? (rest examples) (add1 pos)
                               (add1 pos-total) neg neg-total)]
                         [else (p-h classifier? (rest examples) pos
                                    (add1 pos-total) neg neg-total)])]
                  [else (cond
                          [(not (classifier? (rest (first examples))))
                           (p-h classifier? (rest examples) pos
                                pos-total (add1 neg) (add1 neg-total))]
                          [else (p-h classifier? (rest examples) pos
                                     pos-total neg (add1 neg-total))])]))]
    (p-h classifier? examples 0 0 0 0)))

;; Tests:
;; no pos
(check-expect (performance emu? (random-animals 1000) 'emu) (list 'emu 0 100))
;; no neg
(check-expect (performance eren? eren 'Eren) (list 'Eren 100 0))
;; no neg no pos
(check-expect (performance emu? empty 'emu) (list 'emu 0 0))
;(check-expect (performance emu? (random-animals 1000) 'emu) (list 'emu 100 0))
(check-within (third (performance squirrel? (random-animals 1000) 'squirrel))
              80 20)
(check-within (third (performance goose? (random-animals 1000) 'goose))
              80 20)

