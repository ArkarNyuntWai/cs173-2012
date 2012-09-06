#lang scribble/base

@title{CS173: Programming languages}

@section{Introduction}
How do we go about studying programming languages? Everyone is exposed to some programming languages. How are languages ``classified''?
@itemlist[@item{high level vs low level}
          @item{procedural vs functional}
          @item{typing}
          @item{functional (Scheme, Lisp, Haskell) vs Object oriented (Scala, Java)}
          @item{graphical?}
          @item{stack based}
          @item{compiled vs interpreted vs just in time.}
          @item{declarative (eg: sql)}]

@margin-note{See the video or slides.}

Here are some questions one should ask oneself.

@itemlist[@item{which is the best classification?}
          @item{why are there so many classifications?}
          @item{what do each classification mean?}
          @item{which classification is most useful for a particular applications?}
          @item{how to make those boxes?}]

The most important question

@itemlist[@item{Did we miss any?}]

Turns out that we are missing several classifications.

For eg:
@itemlist[@item{markup languages (eg: html)}
          @item{scripting languages (eg: perl, python, java``script'')}]

Should Python be in scripting languages box and javascript stay where it should be?

People realized these problems and invented multi-paradigm languages (also known as ``blobs'') or in other words ``we have no clue''.

@section{Where did this way of classification come from?}

This comes from a false sense of how to make Computer Science, a science. If you were around in the 60s, the
CS folks got harassed by the real scientists [claiming that CS is not real science].

What did Scientists like John Dalton, Erwin Chargaff and Carl Linnaeus do? They were actually 
doing something very profound. What does the atomic theory give us? There are all these things and people
around us. Each one of these objects are different. Can we break it down into smaller things?

@itemlist[@item{what are those smaller pieces?}
          @item{what are the rules of composition?}]

These two are really powerful ideas. 

@section{What is this class about?}

This class is about thinking scientifically about programming languages. Let us take a Victorian mindset, i.e. 
@italic{``Don't talk to someone until that person is introduced to you''} 

@margin-note{How did they ``bootstrap''?}

In the same way, we (in this class) are only allowed to use concepts that are already introduced in 
@bold{this class}. It is perfectly meaningful to ask whether a program follows a particular style. 
But these terms (like Object Orientation for example) are too vague and means different things in
different languages.

@section{Building from bottom-up}

We are going to be spending a lot of time learning about Building blocks and composition. But the 
reality is that most of us are not here to learn about just the building blocks. Building blocks 
are great if we have a certain mathematical mindset. We are here because we want to confront the 
real world complexity.

Somebody says ``here is a new programming language''. What is it? What does a new programming 
language actually give you.

@itemlist[@item{specification}
          @item{something that runs}]

What do you do when you are given a new language?

@itemlist[@item{look for example programs to study and run}
          @item{make up your own examples}]

And then what do you do? You make up your own programs. @italic{``I wonder''} what happens if I try to 
introduce a variable here or define a new function there. That's the time we actually learn a language.

These days noone gives you a tiny little language. Languages and their manuals are massive because 
everyone wants to do a lot of things with the language and make it seem most useful for all purposes.

Our job is to look inside to see the essence (or the small core) of the language, which is some 
composition of features.

@itemlist[@item{does it have first class functions?}
          @item{closures}
          @item{imperativeness}
          @item{etc...}]

What would happen if we instead evaluate a language purely based on its outward features like ``Objects''
for instance?

Objects mean different in different languages like Java, Ruby, Racket etc.

@section{Desugaring}

So let us talk about core features that are unambiguous in all the languages. We call the process of 
simplification of a language from its outward appearence to the core language as ``desugaring''. We 
call these additional things that a language offers as  ``syntactic sugar''.

Everybody should read Alan Perlis's epigrams every year: http://pu.inf.uni-tuebingen.de/users/klaeren/epigrams.html

@margin-note{``@italic{Syntactic Sugar causes cancer of the semicolon}'' -- Alan Perlis, Epigram 3}

>> Q: Why do we do it on programming languages rather than on programs?
A: It is a compiler so that it can be applied to all programs.

>> Desugaring examples

- digital logic:
  - Lots of different kinds of gates. There are universal gates that can be used to represent lots of different gates
    using one universal gate (like NAND or NOR). This is desugaring.
- Arithmetic:
  - exponentiation: repeated multiplication.
  - addition: repeated add 1.
  - division: repeated subtraction.
  - subtraction: repeated sub 1.
- Looping concepts
  - repeat .. until
  - for
  - do .. while

  - can all be reduced to one kind of loop.

>> Something sneaky going on here. What is that?
  - Hint: there is only one arrow drawn from sugarred form to desugared form.
  - many of these can be done in many ways. (eg: instead of NAND we can use NOR, recursion instead of loops etc etc)
  
  - CS51 (programs -> Turing machines)
  - one can also shrink a program into other things like (Game of life) or Lambda calculus or tree transformation system etc.

  - it is not that there is only one desugaring process possible. There are many ``design choices'' here.
  
So, given a programming language:
 - we are going to desugar it.
 - we prove that the desugared language is correct.

>> one should be able to implement the core language. 
>> In this course, we implement the core language using an interpreter.
>> Sprint graduate course on a mathy version of this course!
>> So we take any program, run it through the desugaring process, run in through the interpreter and this is going to produce our answer. What's the problem?

  - did we get it right? The language came with its own implementation. So, we need to verify correctness.

>> SK's research group does exactly this for ES5, DOM event model, JQuery etc.

>> In this class, we are going to do this twice.
 - one for a language called ``Parceltongue'' <http://harrypotter.wikia.com/wiki/Parseltongue>
 - second for real, for Python.

WARNING: unlikely that most will do for the whole of python.
 - in this course, the staff is going to specify a small subset of Python what we will implement.

>> Q: if we simplify the language, will it run faster?
>> A: that's the kind of decision of design choices that one takes for such optimization.

>> So, this is the recipe for understanding existing languages. The reality is, for half of you here, you really want to build your own language. The other half of you are going to build it without realizing it. And everyone is going to suffer. Everyone builds a little configuration language (like sendmail configuration that has become a huge language in itself).

>> If you build a language, someone will find new ways to put it to use.

>> Every configuration file language becomes one of the following two:
 - it grows up to become a full programming language
 - or it dies.

It dies because nobody cares about it. If someone cares about it, they will send you a feature request. (eg: add let constructs, add functions, closures, generators, exception handling (without thinking about how exceptions interact with generators etc)

>> Here is why I am teaching you this: you can run this entire recipe backwards.
>> Don't do this: (Stackoverflow excerpt) http://stackoverflow.com/questions/3662410/create-my-own-programming-language
 - the answers talk about parsers!
 - this is exactly the kind of things that leads to nonsensical languages.

>> The recipe for good language design:
- Think about what features you have.
- Think about what features you want.
- Think about what features you will be forced to end up with by your users.
- Write a little interpreter, play with the core of the language.
- understand the consequences.
  - there are two ways to understand the language
    - mathematics, that what you should be really doing, but takes effort. (spring course)
    - write the interpreter. Ask the question: ``I wonder''
- Now go to Stackoverflow and ask questions and use ANTLR or whatever.

>> languages are user interfaces and that's why we have multiple such interfaces.
>> layer surface syntax on top of the core after getting it right.

>>> Logistics

- honesty policy. Read and sign it.
- piazza (School called PL Online, course called PL1)
- Code is the indicator of your identity.
- testing infrastructure. We are going to grade ourselves. (``do we get paid as TAs for grading our own programs?'')
- 1650 people signed up from all over the world for the course.
- written assignments of the online folks are not graded.
- Why are we doing this?
  - ``devalue the money we pay for education''
  - ``social obligation''
  - exposure to a broader world of people, interaction.
  - not going to pervert the course because of making it available online. TAs, instructor.
  - course pace is going to be brutal!
- Homework schedule:
  - homework does out every Friday and due next Thursday for the first four weeks.
  (Sept 7-13, 14-20, 21-27, 28-Oct 4)
  - next homework is 10 days long. At the end of that you will have the full implementation of the parceltongue
    plus a few extensions.
  - after that we start with Python.
  - all along the way there will be written homework.

  - learn two languages in the first two weeks:
    - racket and parceltongue.
