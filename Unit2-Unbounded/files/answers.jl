using Revealables

#############
# Lesson 01 #
#############

ans201A = Revealable("""
###Answer A
1. Should look like an upside-down quartic:<br />
<img src=\"files/2-1/quartic.png\" width=100 align=\"left\" />
<br clear=\"all\" />
2. Could be a line or a cubic <br />
<img src=\"files/2-1/line.png\" width=100 align=\"left\" /> <img src=\"files/2-1/cubic.png\" width=100 align=\"left\" />
<br clear=\"all\" />
3. A parabola or absolute value function<br />
<img src=\"files/2-1/parabola.png\" width=100 align=\"left\" /> <img src=\"files/2-1/absval.png\" width=100 align=\"left\" />
<br clear=\"all\" />
4. A symmetric quartic<br />
<img src=\"files/2-1/symquartic.png\" width=100 align=\"left\" />
""", "Answer", false)

ans201B = Revealable("""
###Answer B
To be possible, the numbers of local maxima and minima must be within 1 of each other. Or, with unbounded functions, there can't be both a global maximum and a global minimum.
""", "Answer", false)

#############
# Lesson 02 #
#############

ans202A = Revealable("""
###Answer A

<p>In unit 1, of course, you did this by hand. </p>

<p>It's a lot easier if you just keep the original x as one of the endpoints and only march the other endpoint, instead of marching both endpoints. This will work but will yield a very wide interval in some cases. If you do this and finish early, modify your program so that both endpoints march along.</p>

<p>Here's my version:</p>
<code>
f(x) = x^2 - 4x  # this function is just to test, it can be changed

function threept(f, x, int)  # f is above, x is the given start value, int is the interval (may be large, around 0.5)
    a = x + int  # finding first point location
    if f(a) > f(x)  # testing to see if the function is decreasing and...
        int = -int  # ...reversing direction if not
        a = x + int 
    end
    b = a + int  # another step in same direction
    while f(b) < f(a)  # this loop will run until f(b) is greater than f(a), ie an increase
        x = a  # reassigning variables here... this is what marches the entire interval along.
        a = b 
        b = b + int 
    end
    println(\"\$x, \$(f(x))\")  #prints the three points in order found
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
end
</code>
""", "Answer", false)

ans202B = Revealable("""
###Answer B

The value of h controls two things: first, how accurate your interval is; and second, how many iterations are run. This was discussed in the previous unit: h too large and your interval could be inaccurate (or you might skip over it); h too small and your iteration count goes through the roof. 

Here's my program with the counter thrown in:

<code>
function threept(f, x, int)
    a = x + int
    if f(a) > f(x)
        int = -int 
        a = x + int 
    end
    b = a + int 
    iter = 0
    while f(b) < f(a)
        x = a 
        a = b 
        b = b + int 
        iter = iter + 1
    end
    println(\"\$x, \$(f(x))\")
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
    println(iter)
end
</code>
""", "Answer", false)

ans202C = Revealable("""
###Answer C

The first attempt is fairly straightforward, and the second a little harder.

For the first, a line just before the end of the `while` loop saying `h = 1.5h` will suffice.

For the second, one option is to create a bunch of new variables for the intervals. This is ugly but sufficient.

A much more elegant trick is to notice that the sum of the last two intervals is merely the difference between the first and third current points. In my code, the three points were named `x`, `a`, `b`; so I added a line just before the end of the `while` loop saying `h = b - x`.  

My final code, with counter:

<code>
function threept(f, x, int)
    a = x + int
    if f(a) > f(x)
        int = -int 
        a = x + int 
    end
    b = a + int 
    iter = 0
    while f(b) < f(a)
        x = a 
        a = b 
        b = b + int 
        iter = iter + 1
        int = b - x  # new line creating Fibonacci incrementation of interval width
    end
    println(\"\$x, \$(f(x))\")
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
    println(iter)
end
</code>
""", "Answer", false)

#############
# Lesson 03 #
#############

passwords = Revealable("""
Intelligence that can be (and is) applied to this procedure includes:
* testing the most common passwords, like *Password123*
* testing dictionary words instead of random strings of numbers
* testing numbers related to dates, like year numbers or month-day combinations
* testing user information (usually publicly available on Facebook) like their pet's or spouse's name, their birthday or anniversary. 

If you want to get into a moral lesson here, the obvious conclusion is you want to make your password immune to this sort of intelligence by avoiding common passwords, actual words, actual dates, or personal information.)
""", "More on Passwords and Brute Force", false)

ans203A = Revealable("""
###Sample Answer


Because this program is awful, you won't use it again. The purpose is to:
1. show you how to do a brute-force-type program in case you ever need to
2. solidify the idea of a minimum value and some of the programming concepts behind finding it; and 
3. show you how improvement-y the improvements are in the next few lessons.

<code>
f(x) = x^2 - 4x  # could be anything

function brute(f, int, a, b)  # f = predefined function, interval (very small, like .001), a = left endpoint, b = right endpoint
    low = f(a)  # defining variables; starting with the left endpoint a
    test = a 
    loc = a
    while test < b  # will test all numbers between a and b
            if f(test) < low  # this check runs if the test point is lower than the previous low value
                low = f(test)  # and replaces the old low with the new low
                loc = test  # then records its location for later
            else  # if the test point is higher, nothing happens
            end
        test = test + int  # moves on to the next test point
    end
    println(\"minimum at x = \$loc with y-value = \$low\")  # after getting to b, prints the record low and its location
end
</code>

""", "Answer", false)

#############
# Lesson 04 #
#############

soln204A = Revealable("""
## The Solution
Instead, we divide the interval into three sections instead of two by choosing two interior points instead of one.

<img src=\"files/2-4/solution.png\" width=350 />

Although it would seem obvious to divide the segment into equal thirds, with points at .33 and .67 across the segment, there is a better way.
""", "So what do we do?", false)

ans204A = Revealable("""
###Answer A

Although you won't always be required to write a plan as a practice problem, the longer the code, the more important it is to do so on you own.
1. Start with the endpoints of an interval
2. End when a certain tolerance is reached&mdash;probably the width of the interval is less than [some number] or `f(var) <` [some other number].
3. Divide the interval into three sections by the golden ratio. Choose the section that forms a V (interior point lower than endpoints).
4. Using the new endpoints/interval, loop back to step 3.
""", "Answer", false)

ans204B = Revealable("""
###Answer B
This code does not shorten calculations using the golden ratio property, but you could!

<code>
function fibmin(eq, minlim, maxlim, epsilon)  # equation must be pre-loaded; epsilon is an arbitrary error tolerance.
    phi = (-1+(5)^(1/2))/2  # phi, the golden ratio, used for sectioning below.
        int = maxlim - minlim
        iteration = 0  # keeping track of iterations out of curiosity, not necessary.
        while int > epsilon
            subdiv = phi * int
            lefttest = maxlim - subdiv  # this line and the next create two points within the interval...
            righttest = minlim + subdiv
                if eq(lefttest) < eq(righttest)  # this loop tests the interior points and shifts the endpoints inward accordingly
                    maxlim = righttest
                else
                    minlim = lefttest
                end
            int = maxlim - minlim
            iteration = iteration + 1
        end
    println(\"\$minlim, \$maxlim\")
    println(iteration)
end
</code>
""", "Answer", false)

#############
# Lesson 05 #
#############



ans205A = Revealable("""
###Answer A

One of the tricky things about this task is how much to narrow the interval. I used thirds in my program for speed and convenience, though I worried that thirds might be overly aggressive. There's a possibility that the minimum would occur in the outer third and if I skip over it, I'll end up with an infinite loop in my program. Fortunately infinite loops are easy to identify, and then I would just change my /3 to /4 or /10 or something and repeat.

How did you choose to narrow the interval, and why? 
<code>
function findmin(f, leftbound, rightbound)  # Function `f` will need to be pre-loaded. 
    while rightbound - leftbound > .0001  # This tolerance can be adjusted as needed. Or, add a new defined variable `tolerance`.
        slope = (f(rightbound) - f(leftbound))/(rightbound - leftbound)
        if slope < 0
                leftbound = leftbound + (rightbound - leftbound)/3  # here's that /3 - modify as needed
        elseif slope > 0
                rightbound = rightbound - (rightbound - leftbound)/3
        else  # In the special case where the slopes are equal it marches both endpoints in. 
            leftbound = leftbound + (rightbound + leftbound)/3 
            rightbound = rightbound - (rightbound + leftbound)/3
        end
    end
    println(\"\$leftbound, \$rightbound\")  # Prints the boundaries, from which you can estimate the location of the minimum
end
</code>
""", "Answer", false)

ans105B = Revealable("""
###Answer B
1. Points should be: (0, 0) (0.6, -2.04) (1.2, -3.36) (1.8, -3.96) (2.4, -3.84). The interval/answer is bolded.

2. (2, -4) (2.5, -6.125) This is going the wrong direction; change step to -0.5. [If you didn't pay attention, you got the minimum, around 3.] Complete answer: (2, -4) (1.5, -1.375) (1, 1) (.5, 2.375) (0, 2)
""", "Answer", false)

ans105C = Revealable("""
###Answer C
Answers will vary greatly depending on starting \$x\$, starting \$h\$, and how you increment \$h\$ (Fibonacci numbers are only a suggestion).

Make sure you are beginning with a small \$h\$ (at most 0.5). It will ramp up fairly quickly as you increase its value.

1. The local maximum is at \$x = -8.6852\$. Note that this cubic is unbounded on both left and right so if you choose a starting \$x\$ greater than 12 or so, your numbers will fly off to infinity.

2. This function has a few local minima past -12, but as long as you choose an \$x\$-value greater than -11 or so, you should reach the absolute minimum at around \$x = 2.75172\$.
""", "Answer", false)

#############
# Lesson 06 #
#############

hint206A = Revealable("""
Step 1: determine direction of *increase* (meaning, `f(x + h)` or `f(x - h)` is *higher*, not lower, than `f(x))`.

Step 2: mark off intervals until the y-values *decrease* (meaning, `f(x + h)` is *lower* than `f(x))`.

Step 3: does not change.
""", "Just a few things...", false)

ans206A = Revealable("""
###Answer A
<code>
function threeptmax(f, x, int) # f is the pre-loaded function (above), x is the initial value, int is the initial test interval (small).
    a = x + int
    if f(a) < f(x)
        int = -int
        a = x + int
    end
    b = a + int
    iter = 0  # no reason to keep track of iterations, just curious
    while f(b) > f(a)
        x = a  # stepping the interval along
        a = b
        b = b + int
        iter = iter + 1
        int = b - x  # this increases the interval width in a Fibonacci pattern.
    end
    println(\"\$x, \$(f(x))\")
    println(\"\$a, \$(f(a))\")
    println(\"\$b, \$(f(b))\")
    println(iter)
end
</code>
""", "Answer", false)

hint206B = Revealable("""
Step 1: The interval will now surround a *maximum*&mdash;easy because you now have a 3-point max program.

Step 2: Does not change.

Step 3: The endpoints of the chosen interval will now be *lower* than the midpoint.

Step 4: Does not change.
""", "Half the steps change.", false)

ans206B = Revealable("""
###Answer B
<code>
function fibmax(f, minlim, maxlim, epsilon)  # equation specified at the end. See above for cautions on minlim, maxlim. Epsilon is the acceptable interval width/error.
    phi = (-1+(5)^(1/2))/2  # the value of the golden ratio, about 61.8%, used as our sectioning number
    int = maxlim - minlim
    iteration = 0  # totally unnecessary to keep track of iterations, but why not
    while int > epsilon  # loop runs until the interval is within the tolerance specified.
        subdiv = phi * int  # these three lines mark two points within the interval
        lefttest = maxlim - subdiv  
        righttest = minlim + subdiv
        if f(lefttest) > f(righttest)  # loop decreases interval by shifting endpoints inward to the inner point with the highest function value
            maxlim = righttest
        else
            minlim = lefttest
        end
        int = maxlim - minlim
        iteration = iteration + 1  # again, not necessary.
    end
    println(\"\$minlim, \$maxlim\")
    println(iteration)  # still not necessary. Interesting maybe.
end
</code>
""", "Answer", false)

ans206C = Revealable("""
###Answer C
<code>
function findmin(f, leftbound, rightbound)  # Function `f` will need to be entered below. Leftbound and rightbound are your interval endpoints; see note above.
    while rightbound - leftbound > .0001  # This tolerance is arbitrary and can be adjusted as needed. Or, add a new defined variable `tolerance`
        slope = (f(rightbound) - f(leftbound))/(rightbound - leftbound)
        if slope > 0
            leftbound = leftbound + (rightbound - leftbound)/3
            # The division by 3 above and below is arbitrary and aggressive.
            # If you get an infinite loop you may want to adjust the step lower, say /4 or /10.
            # This will make the algorithm relatively slower but also less likely to overshoot the minimum.
        elseif slope < 0
            rightbound = rightbound - (rightbound - leftbound)/3
        else  # In the special case where the slopes are equal it marches both endpoints in.
            leftbound = leftbound + (rightbound + leftbound)/3
            rightbound = rightbound - (rightbound + leftbound)/3
        end
    end
    println(\"\$leftbound, \$rightbound\")  # Note that the response is the boundaries, from which you can probably estimate the minimum; if not, adjust the tolerance above.
end
</code>
""", "Answer", false)

ans206D = Revealable("""
###Answer D
The minima are at -0.421 and 2.256
The maximum is at 0.790.

What you're really doing here is testing your code&mdash;if your answers don't agree (and you correctly entered __-__f(x) when trying to make the program do the opposite of what it was built to do), then there is something wrong with at least one of your programs! If the answers all agree, then there is probably nothing wrong with your programs.
""", "Answer", false)


#############
# Lesson 07 #
#############

ans207A = Revealable("""
###Answer A
<code>
function ybasedint(f)
    step = 2  # totally arbitrary.
    testpos = 0
    testneg = 0
    while -1000000 < f(testpos) < 1000000  # also totally arbitrary.
        testpos = testpos + step
    end
    while -1000 < f(testneg) < 1000
        testneg = testneg - step
    end
    println(testneg)
    println(testpos)
end
</code>
""", "Answer", false)

ans207B = Revealable("""
###Answer B
<code>
f(x) = x^4 + 35x^3 - 1062x^2 - 8336x + 47840  # the function analyzed

function gridsearch(f, a, b)  #f is the function, a and b the endpoints of the interval in order
    int = b - a 
    int = int/5  # divides interval into 50 subintervals
    test = a  # everything start with a. Test is the point we're currently testing...
    low = f(a)  # low is the record low value so far
    save = a  # save is the x-value corresponding to the record low
    while test < b  # this loop will run until we've tested all the points from a to b
        if f(test)<low  # if the y-value is lower than the current lowest,
            low = f(test)  # then this loop replaces the current (save, low) with the new (save, low)
            save = test
        end
    test = test + int  # moving on to the next point
    end
    println(\"seed with x = \$save\")
end
</code>
""", "Answer", false)

ans207C = Revealable("""
###Answer C
The main reason to do this is it's kind of nice to have one program that does everything rather than having to transfer by hand, but when I combined mine I noticed how glad I was that my code was documented.

It looks so simple, but it is truly a pain in the butt. Since you wrote the three earlier programs in separate sittings, you probably have different variables for the same thing in all the different programs. You will have to unify like variables under a common name and separate variables that you accidentally named the same thing but are different. You will also have to maintain attention to the order of interval endpoints if any of the programs require them to be in numerical order.

Other than that, it's just a matter of deleting the `function` and `end` commands from the top and bottom of each individual program, then putting a great big `function` and `end` to bracket the whole thing.
<code>
function globalmin(f, a, b)  # f is the function, a and b the endpoints of the interval in order
    # This composite function combines a grid search, a 3-point interval, and a slope-based minimization program to find a global minimum.
    
    # the first part of the program is a grid search to determine a good starting point.
    int = b - a
    int = int/50  # divides interval into 50 subintervals
    test = a  # everything starts with a. Test is the point we're currently testing...
    low = f(a)  # low is the record low value so far
    save = a  # save is the x-value corresponding to the record low
    while test < b  # this loop will run until we've tested all the points from a to b
        if f(test)<low  # if the y-value is lower than the current lowest,
        low = f(test)  # then this loop replaces the current (save, low) with the new (save, low)
        save = test  # save will return the location of the lowest point
    end
    test = test + int  # moving on to the next point
  end

    # the next part of the program is a 3-point interval search, using "save" as the seed point, the location of the record low from the grid search
    int = int/10  # initial interval is 1/10 the previous interval
    a = save + int  # first test point is 1 interval unit from the starting point
    if f(a) > f(save)  # this loop checks direction of motion to ensure we're heading to a minimum
        int = -int
        a = save + int
    end
    b = a + int
    while f(b) < f(a)
        save = a  # stepping the interval along
        a = b
        b = b + int
        int = b - save  # this increases the interval width in a Fibonacci pattern.
    end
  
    # finally, the last part of the program minimizes in the interval [save, a].
    left = min(b, save)
    right = max(b, save)
        phi = (-1+(5)^(1/2))/2  # phi, the golden ratio, used for sectioning below.
        int = right - left
        while int > 0.00001  # tolerance, change as needed
            subdiv = phi * int
            lefttest = right - subdiv  # this line and the next create two points within the interval...
            righttest = left + subdiv
            if f(lefttest) < f(righttest)  # ...while this loop tests the interior points in the function and shifts the interval endpoints inward accordingly.
            right = righttest
        else
            left = lefttest
        end
        int = right - left
    end
    println(\"\$left, \$right\")
end
</code>
""", "Answer", false)

#############
# Lesson 08 #
#############

slope = Revealable("""
##Curved Functions and Slope
__Slope__ is a term used to describe the steepness of straight lines. 
<img src=\"files/2-8/slopes.png\" width=200 />

But even curved functions have *steepness*.
<img src=\"files/2-8/function.png\" width=200 />

In this diagram, the steepest part of the curve is steeper than the yellow line, and shallower than the red line, and about the same as the green line.
<img src=\"files/2-8/redgreenyellowslopes.png\" width=200 />
""", "Slope Review", false)

hint208A = Revealable("""
The math here can get ugly. Some ways to make it less ugly:
1. Enter the function `f(x)` into Julia and use that to evaluate y-values.
2. Use point-slope form for your linear equations.
3. Continue to use point-slope form when solving. The slopes of adjacent lines are opposite so the x-values will cancel nicely every time.
""", "Hints for Easier Calculations", false)

ans208A = Revealable("""
###Answer A
1. (-5, 75), (1, 183), (7, 291)

2. y - 75 = 450(x + 5); y - 183 = -450(x - 1); y - 183 = 450(x - 1); y - 291 = -450(x - 7)

3. (-1.88, 1479), (4.12, 1587)
""", "Answer", false)

ans208B = Revealable("""
###Answer B
Very subtle note here: Because of the nature of the method, the left hand point will always reach forward with a positive slope m, towards the right hand point which reaches back with a negative slope -m. The equations are written with the assumption that (x1, y1) are the left hand point and (x2, y2) are the right hand point. Therefore order is important when calling the program.
<code>
function intersect(x1, y1, x2, y2)
    m = 450
    ycross = (m*(x2 - x1) + (y1 + y2))/2
    xcross = (ycross - y1)/m + x1
    println(\"x = \$xcross\")
    println(\"y = \$ycross\")
end
</code>
""", "Answer", false)

ans208C = Revealable("""
###Answer C
1. On the function, (4.12, 494.840ish)
2. Two new points: (2.9065, 1040.9199) and (5.3335, 1040.9199)

These two have the same y-value. Neither has the current high y-value which is (-1.88, 1479), but if two were ever tied you would just pick one and run with it. Tradition says left first.
""", "Answer", false)

steps208 = [Revealable("""
<img src=\"files/2-8/step1.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step2.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step3.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step4.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-8/step5.png\" width=300 />
""", "", true)]

ans208D = Revealable("""
###Answer D
In most languages, you'd need a return line. In Juila, functions automatically return the last value they touch, so Julia functions don't usually have a return line.
<code>
function listpoints(A, x1, x2)
  A = vcat(A, [x1 x2])
  A = sortrows(A)
    # `return A` would go here, but Julia doesn't need it
end

A = listpoints([-5 75], 1, 183)
A = listpoints(A, 7, 291)
A = listpoints(A, -1.88, 1479)
A = listpoints(A, 4.12, 494.840)
A = listpoints(A, 2.91, 1040.92)
A = listpoints(A, 5.33, 1040.92)
println(A)
</code>
""", "Answer", false)

ans208E = Revealable("""
###Answer E
9 points: [-5.0 75.0 / -3.122 919.98 / -1.88 360.961 / -0.63 919.98 / 1.0 183.0 / 2.91 1040.92 / 4.12 494.84 / 5.33 1040.92 / 7.0 291.0]

11 points: [-5.0 75.0 / -3.122 919.98 / -1.88 360.961 / -0.63 919.98 / 1.0 183.0 / 2.12 688.95 / 2.91 335.403 / 3.69 687.3715 / 4.12 494.84 / 5.33 1040.92 / 7.0 291.0]
""", "Answer", false)

ext208 = Revealable("""
###Extension Program

I split this program into multiple functions, which is a good idea when programs get complex and hard to read. Plus, I call `augment` multiple times. Having that code in a sub-function means that I don't have to rewrite it over and over.

<code>
    # pre-defined function
g(x) =  -x^4 + 4x^3 + 30x^2 - 50x + 200 # function value here 

    # this function will be called later to find intersection points of a line with slope m through (x1, y1) and a line with slope -m through (x2, y2)
function augment(A, maxslope, x1, y1, x2, y2)  # must be in order, left point first.
    ycross = (maxslope*(x2 - x1) + (y1 + y2))/2
    xcross = (ycross - y1)/maxslope + x1
    A = vcat(A, [xcross ycross])
end

function sawtooth(f, maxslope, left, right)  # function, maximum slope, left and right boundaries only 
    A = [left f(left); (left + right)/2 f((left + right)/2); right f(right)]
    A = augment(A, maxslope, A[1,1], A[1,2], A[2, 1], A[2,2])
    A = augment(A, maxslope, A[2,1], A[2,2], A[3,1], A[3,2])
    A = sortrows(A)
    for n = 1:5
        loc = findmax(A[:, 2])[2]  # returns the index of the highest number in the 2nd column of A
        A[loc, 2] = f(A[loc])
        A = augment(A, maxslope, A[loc-1, 1], A[loc-1, 2], A[loc, 1], A[loc, 2])
        A = augment(A, maxslope, A[loc, 1], A[loc, 2], A[loc+1, 1], A[loc+1, 2])
        A = sortrows(A)
    end
    println(A)
end

sawtooth(g, 450, -5, 7)
</code>
""", "Answer", false)

#############
# Lesson 09 #
#############

ans209A = Revealable("""
###Answer A
I chose to use a `for` loop on this, but a `while` loop with a counter would work perfectly well also.

```
function fibstring(n)
    fibs = [1, 1]  # preloading the array fibs and variables
    a = 1
    b = 1
    for x in 1:(n - 2)  # since I already have 2 elements, for n elements total I need (n - 2) more elements.
            c = a + b  # finding the next term...
            a = b  # ...and redefining the other variables 
            b = c 
            push!(fibs, c)  # finally tack c on the end of fibs; this step could have been earlier
    end
    println(fibs)  # at the end, print out the final list
end
```
""", "Answer", false)

ans209B = Revealable("""
###Answer B

    function vector(s, t)
        vec = t - s
        println (\"The vector from s to t is \$vec\")
        v = s + 1.5 * vec
        println(\"The new point v is \$v\")
    end
```
""", "Answer", false)

#############
# Lesson 10 #
#############

ans210A = Revealable("""
###Answer A
1. 134, 4, 21
2. Make sure you are getting a visual of what this does: it evaluates a function at a given point, then a smidgen above, a smidgen below, a smidgen right, and a smidgen left, then minimizes those values. The answers are: (3, 4.9); (1.9, 0); (-4, -0.9)

There are a lot of different ways to accomplish this task. Mine is below. 

<code>
f(a, b) = a^2 + 5*b^2

function brute4(f, a, b)
    A = [a b; a+.1 b; a-.1 b; a b+.1; a b-.1]  # for brute force, I think using arrays is pretty slick.
    vals = [ ]
    for n in 1:5
        vals = vcat(vals, f(A[n], A[n+5]))  # builds a column array with successive values of points
    end
    loc = findmin(vals)[2]  # returns the location of the maximum value of vals (findmin(vals) alone will give a string of (value, location))
    println(\"x1 at \$(A[loc]) and x2 at \$(A[loc + 5])\")
end
</code>
""", "Answer", false)

steps210 = [Revealable("""
<img src=\"files/2-10/step1.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step2.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step3.png\" width=300 />
""", "", true), Revealable("""
<img src=\"files/2-10/step4.png\" width=300 />
""", "", true)]

ans210B = Revealable("""
###Answer B
The first practice function should narrow down to the origin; the second to (4, -3).

Again, multiple ways to do this. 
<code>
f(a, b) = a^2 + 5*b^2

function brute4min(f, a, b)
    loc = 7  # could be anything other than 1 as a seed, I just like 7
    while loc != 1  # stops the loop when the location of the ideal is position 1 (the original point)
        A = [a b; a+step b; a-step b; a b+step; a b-step]  # array stores all 5 points to test.
        vals = [ ]
        for n in 1:5
            vals = vcat(vals, f(A[n], A[n+5]))  # builds a column array with successive values of points
        end
        loc = findmin(vals)[2]  # returns the location of the maximum value of vals (findmin(vals) alone will give a string of (value, location))
        a = A[loc]
        b = A[loc + 5] # taking advantage of fixed length of A at 5 to index directly rather than row, column
        end
        step = step/10        
    end
    println(\"x1 = \$(round(a, 3)) and x2 = \$(round(b, 3))\")  # rounding to 3 decimal places
end
</code>
""", "Answer", false)

ans210C = Revealable("""
###Answer C
Answers should approach approximately (0.7313..., -0.3656...).
""", "Answer", false)

ans210D = Revealable("""
###Answer D
<code>
function brute4min(f, a, b)
    step = 1
    for n in 1:8
        loc = 7  # could be anything other than 1 as a seed, I just like 7
        while loc != 1  # stops the loop when the location of the ideal is position 1 (the original point)
            A = [a b; a+step b; a-step b; a b+step; a b-step]  # array stores all 5 points to test.
            vals = [ ]
            for n in 1:5
                vals = vcat(vals, f(A[n], A[n+5]))  # builds a column array with successive values of points
            end
            loc = findmin(vals)[2]  # returns the location of the maximum value of vals (findmin(vals) alone will give a string of (value, location))
            a = A[loc]
            b = A[loc + 5] # taking advantage of fixed length of A at 5 to index directly rather than row, column
        end
        step = step/10
        println(\"x1 = \$a and x2 = \$b\")  # note that this will print out each successive result, not just a final one; move this down if all you want is final
    end
end
</code>
""", "Answer", false)

ans210E = Revealable("""
###Answer E

The actual minimum occurs at (1, 1). My version of this code came up with a starting point of (-0.6, -0.6). This was close enough to give the actual minimum using the previous program.
<code>
f(a, b) = 100*(a - b)^2 + (1-b)^2

function gridsearch(f, a, b, c, d)
    int1 = (b-a)/5  # splits the x1 interval into 5 sections, 6 total points 
    int2 = (d-c)/5  # same for x2
    min = f(a, c)
    A = [a c]  # seeds (a, c) as initial minimum point
    for x in {a + int1*n for n in 0:5}  # array of 6 evenly spaced points from a to b
        for y in {c + int2*n for n in 0:5}  # nested, 6 evenly spaced points from c to d
            test = f(x, y)
            if test < min  # if the function value here is lower than the current min, replaces it and location
                min = test
                A = [x y]
            end
        end
    end
    println(\"x1 = \$(A[1]), x2 = \$(A[2])\")  # prints the location of the lowest value
end
</code>
""", "Answer", false)

ext210 = Revealable("""
###Sample Answer
<code>
function brute4min(f, a, b, c)
    step = 1
    for n = 1:8
        loc = 7  # could be anything other than 1 as a seed, I just like 7
        while loc != 1  # stops the loop when the location of the ideal is position 1 (the original point)
            A = [a b c; a+step b c; a-step b c; a b+step c; a b-step c; a b c+step; a b c-step  # add c and steps of c into A
            vals = [ ]
            for n = 1:5
            vals = vcat(vals, f(A[n], A[n+7], A[n+14]))  # builds a column array with successive values of points. A has 7 rows
        end
            loc = findmin(vals)[2]  # returns location of maximum value of vals (loc alone will give a string of (value, location))
            a = A[loc]
            b = A[loc + 7] # A's length is fixed at 7, so we can index directly
            c = A[loc + 14]
        end
        step = step/10
        println(\"x1 = \$a, x2 = \$b, x3 = \$c\")  # now prints out all 3 variables
    end
end
</code>
""", "Answer", false)

#############
# Lesson 11 #
#############

ans211A = Revealable("""
###Answer A
All improvement should be in the direction of the minimum, (3, -1).

For my code, I chose to use arrays rather than if/else replacement, but either one should work.
<code>
f(a, b) = (a-3)^2 + (b+1)^2

function hjbegin(f, a, b)
    S = [a a+.1 a-.1]  # establishes an array S with our test points on x1
    A = [ ]  # seeds an empty set A
    for n in 1:3 
        A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
    end
    c = S[findmin(A)[2]]  # assigns the name "c" to the coordinate of S with the lowest function value
    A = [ ]  # resets A as empty
    T = [b b+.1 b-.1]  # establishes T with test points on x2
    for n in 1:3 
        A = vcat(A, f(c, T[n]))  # builds A with function values of T.   
    end
    d = T[findmin(A)[2]]  # assigns the name "d" to the coordinate of T with the lowest function value
    println(\"\$a, \$b\")
    println(\"\$c, \$d\")
    println(\"\$(c-a), \$(d-b)\")  # returns the vector between the original and improved point
end
</code>
""", "Answer", false)


ans211B = Revealable("""
###Answer B
You should get something very close to the true minimum at (3, -1).
<code>
f(a, b) = (a-3)^2 + (b+1)^2

function vectorsearch(f, a, b, x, y)  # a and b are coordinates of the starting point; x, y is vector found by hjbegin
    while f(a + x, b + y) < f(a, b)
        a = a + x 
        b = b + y 
    end
    println(\"\$a, \$b\")
end
</code>
""", "Answer", false)


ans211C = Revealable("""
###Answer C
Answers should converge towards (0.7315ish, -0.3658ish).

If you have the written steps from the first part, you should see the same results from the combined code without the need to switch between two programs.
<code>
function hj(f, a, b) # function and starting point
    int = .1 
    S = [a a+int a-int]  # establishes an array S with our test points on x1. 
    A = [ ]  # seeds an empty set A
    for n in 1:3 
        A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
    end
    c = S[findmin(A)[2]]  # assigns the name `c` to the coordinate of S with the lowest function value
    A = [ ]  # resets A as empty
    T = [b b+int b-int]  # establishes T with test points on x2
    for n in 1:3 
        A = vcat(A, f(c, T[n]))  # builds A with function values of T.   
    end
    d = T[findmin(A)[2]]  # assigns the name `d` to the coordinate of T with the lowest function value
    vectorx = c - a 
    vectory = d - b
    while f(c + vectorx, d + vectory) < f(c, d)
        c = c + vectorx
        d = d + vectory
    end
    println(\"\$c, \$d\")
end
</code>
""", "Answer", false)


ans211D = Revealable("""
###Answer D
Answers should approach (0.7314ish, -0.3657ish)
<code>
function hj(f, a, b) # function and starting point
    int = .1 
    vectorx = 100  # could be any nonzero, just being careful here
    vectory = 100
    while vectorx != 0 && vectory != 0
        S = [a a+int a-int]  # establishes an array S with our test points on x1. 
        A = [ ]  # seeds an empty set A
        for n in 1:3 
            A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
        end
        c = S[findmin(A)[2]]  # assigns the name `c` to the coordinate of S with the lowest function value
        A = [ ]  # resets A as empty
        T = [b b+int b-int]  # establishes T with test points on x2
        for n in 1:3 
            A = vcat(A, f(c, T[n]))  # builds A with function values of T.   
        end
        d = T[findmin(A)[2]]  # assigns the name `d` to the coordinate of T with the lowest function value
        vectorx = c - a 
        vectory = d - b
        while f(c + vectorx, d + vectory) < f(c, d)
            c = c + vectorx
            d = d + vectory
        end
        a = c 
        b = d
    end
    println(\"\$a, \$b\")
end
</code>
""", "Answer", false)


ans211E = Revealable("""
###Answer E
Answers should approach (0.731404, -0.365702).
<code>
f(a, b) = (a+b)^2 + (sin(a+2))^2  + b^2 + 10

function hj(f, a, b) # function and starting point
    int = 1 
    for n in 1:7  # this will end up with an interval of 0.000001.
        vectorx = 100  # could be any nonzero, just being careful
        vectory = 100
        while vectorx != 0 && vectory != 0
            S = [a a+int a-int]  # establishes an array S with our test points on x1. 
            A = [ ]  # seeds an empty set A
            for n in 1:3 
                A = vcat(A, f(S[n], b))  # builds A with function values of each point in S. 
            end
            c = S[findmin(A)[2]]  # assigns the name `c` to the coordinate of S with the lowest function value
            A = [ ]  # resets A as empty
            T = [b b+int b-int]  # establishes T with test points on x2
            for n in 1:3 
                A = vcat(A, f(c, T[n])  # builds A with function values of T.   
            end
            d = T[findmin(A)[2]]  # assigns the name `d` to the coordinate of T with the lowest function value
            vectorx = c - a 
            vectory = d - b
            while f(c + vectorx, d + vectory) < f(c, d)
                c = c + vectorx
                d = d + vectory
            end
            a = c 
            b = d   
        end
        int = int/10
    end
    println(\"\$a, \$b\")
end
</code>
""", "Answer", false)

#############
# Lesson 12 #
#############

xsection = Revealable("""
You should be able to identify stuff that looks like parabolas in both vertical cross-sections down the middle. The horizontal cross-sections are ellipses. 

This function is f(x<sub>1</sub>, x<sub>2</sub>) = (x<sub>1</sub>)<sup>2</sup> + 2(x<sub>2</sub>)<sup>2</sup>. If you're familiar with conic sections, you should be able to see the elliptical equation in the variables. 
""", "You might see...", false)

ans212A = Revealable("""
###Answer A
1. f(x<sub>1</sub>, -1) = (x<sub>1</sub> - 3)<sup>2</sup> + 16; or, f(x) = (x - 3)<sup>2</sup> + 16. 
2. minimized at x = 3. (If you've studied quadratics, you knew this&mdash;the function is a parabola in vertex form.)
3. f(3, x<sub>2</sub>) = 0 + (x<sub>2</sub> + 5)<sup>2</sup>; or, f(x) = (x + 5)<sup>2</sup>. Minimized at -5; again, you knew this.
The answer, (3, -5), is the minimum of this function. This happened here because it's a very simple function, but it won't always.
""", "Answer", false)

ans212B = Revealable("""
###Answer B
(-1, .5), function value = 3.25 at original, 0.5 at new. It's a solid improvement but still not a minimum over the entire function.

The vector from (0.5, 1) to (-1, 0.5) is &lt;-1.5, -0.5&gt;.
""", "Answer", false)

ans212C = Revealable("""
###Answer C
1. The new point is (-1-1.5a, .5 -.5a)
2. The raw version is f(x<sub>1</sub>, x<sub>2</sub>) = (-1 - 1.5a)<sup>2</sup> + 2(.5 - .5a)<sup>2</sup> + 2(-1 - 1.5a)(.5 - .5a). If you simplified, you would get f = 4.25a<sup>2</sup> + 1.5a + .5.

Notice in Part 2: the new function is a function in one variable, and therefore *can be minimized*. 
""", "Answer", false)

ans212D = Revealable("""
###Answer D
1. a = -0.17647.
2. Since the new point was (-1 - 1.5a, .5 - .5a), plugging in a = -0.17647 yields (-0.7353, 0.5882).
3. f(-0.7353, 0.5882) = 0.3676.
""", "Answer", false)

ans212E = Revealable("""
###Answer E
Okay, I cheated a little. I have two subprograms with the same name (`fibmin`) but different inputs. Julia can handle it! (Google \"Julia multiple dispatch\" if you want to know more.) Depending on which arguments I pass in, Julia chooses the correct `fibmin` function.

Maybe you came up with a more elegant way.
<code>
function fibmin(f, a, b, dim)  # input: function, two variables, and which dimension to minimize
    phi = (-1+(5)^(1/2))/2
    maxlim = 10  # interval endpoints, change as needed
    minlim = -10
    tolerance = 0.000001  # change as needed
    int = maxlim - minlim
    while int > tolerance
        subdiv = phi*int
        lefttest = maxlim - subdiv  # these two lines create two points within the interval
        righttest = minlim + subdiv
        if dim == 1  # minimize dimension variable #1 (a)?
            moverightbound = f(lefttest, b) < f(righttest, b)
            else  # if not, minimize dimension variable #2 (b)
            moverightbound = f(a, lefttest) < f(a, righttest)
        end
        if moverightbound  # loop shifts interval boundaries
            maxlim = righttest
        else
            minlim = lefttest
        end
        int = maxlim - minlim
    end
    (maxlim + minlim)/2  # return value of minimized variable
end

function fibmin(f)  # input: function
    phi = (-1+(5)^(1/2))/2
    maxlim = 10  # interval endpoints, change as needed
    minlim = -10
    tolerance = 0.000001  # change as needed
    int = maxlim - minlim
    while int > tolerance
        subdiv = phi*int
        lefttest = maxlim - subdiv  # create two points within the interval
        righttest = minlim + subdiv
        if f(lefttest) < f(righttest)  # loop shifts interval boundaries
            maxlim = righttest
        else
            minlim = lefttest
        end
        int = maxlim - minlim
    end
    (maxlim + minlim)/2  # return minimum x-value
end

function cyclic(f, a, b)  # f is a function in 2 variables; (a, b) is the seed point 
    q = 20  # any high number will do
    f1 = 0 
    f2 = 20
    while abs(f1 - f2) > 0.0001  # tolerance for final answer
        c = fibmin(f, a, b, 1)  # minimize a
        d = fibmin(f, c, b, 2)  # minimize b
        g(x) = f(c + (c-a)*x, d + (d-b)*x)  # g is single-variable function of vector from (a,b) beyond (c,d).
        q = fibmin(g)  # minimize g(x) (to find the scalar)
        f1 = f(a, b)
        a = c + (c-a)*q
        b = d + (d-b)*q
        f2 = f(a,b)
    end
    println(\"x1 = \$a, x2 = \$b, value = \$(f(a, b))\")
end
</code>
""", "Answer", false)

#############
# Lesson 13 #
#############

hint213A = Revealable("""
###Hint A
In each case, it's mostly a matter of switching \"&lt;\" with \"&gt;\".

No solution is given for this problem. Solving it is entirely up to you!
""", "Hint", false)

ans213B = Revealable("""
###Answer B
1. For my Hooke-Jeeves, not much would change because I used arrays. If they went with multiple variables instead of arrays, it will require a lot more work here because the number of variables goes up quickly with the number of dimensions. Otherwise the algorithm is the same: test a bunch of points, find the best one, form a vector from the original, push along that vector until it stops minimizing, then repeat, shrinking the interval as needed.

2. In my program, I'd have to change my first `fibmin` function to allow more variables, and I'd need to modify the part where I check which dimension is being minimized. Other than that not much would change: once you minimize each variable, you form a vector and minimize that (it will still be an equation in 1 variable, a), then repeat.
""", "Answer", false)

ans213C = Revealable("""
###Answer C
1. For my Hooke-Jeeves, not much would change because I used arrays. If they went with multiple variables instead of arrays, it will require a lot more work here because the number of variables goes up quickly with the number of dimensions. Otherwise the algorithm is the same: test a bunch of points, find the best one, form a vector from the original, push along that vector until it stops minimizing, then repeat, shrinking the interval as needed.

2. In my program, I'd have to change my first `fibmin` function to allow more variables, and I'd need to modify the part where I check which dimension is being minimized. Other than that not much would change: once you minimize each variable, you form a vector and minimize that (it will still be an equation in 1 variable, a), then repeat.
""", "Answer", false)

#############
# Lesson 14 #
#############

ans214A = Revealable("""
###Answer A
Answers will vary, of course. 
1. should use `rand()`
2. should use `40 + 5*rand()`
3. should use `randn()`
4. should use `20 + 4.2*randn()`
""", "Answer", false)

ans214B = Revealable("""
###Answer B
Somewhere in the 10-13 range, more or less, would be typical, but on one trial you could get almost anything.
""", "Answer", false)

ans214C = Revealable("""
###Answer C
Answers will vary, of course. I got 11.58; 11.83; 11.79; 11.75. 

The actual average appears to be around 11.8, ish. If you wrote your answers with more than 2 decimal places, DON'T!!!! This method is not that accurate and it is irresponsible to report results as if it is.
<code>
function travel(n)
    total = 0
    for x in 1:n
        a = 1 + 3&#42;rand() + .8 + .35&#42;randn() + .5 + 1.5&#42;rand() + 4 + .1&#42;randn() + .25 + 3 + .8&#42;randn()
        total = total + a
    end
    average = total/n 
    println(average)
end

travel(20)
</code>
""", "Answer", false)

ans214D = Revealable("""
###Answer D
Answers will vary. For my five trials I got 14.878, 14.619, 14.711, 14.628, and 14.812. I would guess the actual average to be around 14.7 hours.
<code>
function travel(n)
    total = 0
    for x in 1:n
        a = (1 + 3&#42;rand() )
        if a >= 2
            a = a + 1.2 + .6&#42;rand()
        else
            a = a + .8 + .35&#42;randn()
        end
        a = a + .8 + .35&#42;randn() + .5 + 1.5&#42;rand() + 4 + .1&#42;randn() + .25
        if a > 9 
            a = a + 5.1 + 1.9&#42;randn()
        else
            a = a + 3 + .8&#42;randn()
        end
        total = total + a 
    end
    average = total/n 
    println(average)
end

travel(500)
</code>
""", "Answer", false)
