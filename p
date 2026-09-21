# Mini module system: math and random module explorer
import functools
import math
import random
import sys

# Force output flushing
print = functools.partial(print, flush=True)


def get_float(prompt):
    """Read a floating-point value, retrying until the input is valid."""
    while True:
        try:
            print(prompt, end=" ")
            return float(input())
        except ValueError:
            print(">> Invalid input. Please type a number (for example, 3 or .5).")
        except EOFError:
            print("\n>> No input received. Exiting program.")
            raise SystemExit


def safe_input(prompt):
    try:
        print(prompt, end=" ")
        return input()
    except EOFError:
        print("\n>> No input received. Exiting program.")
        raise SystemExit


def pause():
    safe_input("\nPress ENTER to return to the menu....")


def print_header(title):
    print("\n" + "=" * 70)
    print(" " + title)
    print("=" * 70)


# Section 1: Trigonometric (circular) functions
def trig_menu():
    print_header("TRIGONOMETRIC (CIRCULAR) FUNCTIONS")
    print("""
    1. Show the value of pi
    2. Convert degrees -> radians
    3. Convert radians -> degrees
    4. Compute sin, cos, tan of an angle (in degrees)
    5. Compute asin, acos, atan of a value
    0. Back to Main Menu
""")
    choice = safe_input("Enter your choice:").strip()

    if choice == "1":
        print("\nmath.pi = {}".format(math.pi))
    elif choice == "2":
        degrees = get_float("Enter an angle in degrees:")
        print("\n{} degrees = {} radians".format(degrees, math.radians(degrees)))
    elif choice == "3":
        radians = get_float("Enter an angle in radians:")
        print("\n{} radians = {} degrees".format(radians, math.degrees(radians)))
    elif choice == "4":
        degrees = get_float("Enter an angle in degrees:")
        radians = math.radians(degrees)
        print("\nAngle = {} degrees ({} radians)".format(degrees, radians))
        print("sin({}) = {}".format(degrees, math.sin(radians)))
        print("cos({}) = {}".format(degrees, math.cos(radians)))
        print("tan({}) = {}".format(degrees, math.tan(radians)))
    elif choice == "5":
        value = get_float("Enter a value:")
        try:
            print("asin({}) = {} radians ({} degrees)".format(
                value, math.asin(value), math.degrees(math.asin(value))))
            print("acos({}) = {} radians ({} degrees)".format(
                value, math.acos(value), math.degrees(math.acos(value))))
        except ValueError:
            print("asin(x) and acos(x) require -1 <= x <= 1.")
        print("atan({}) = {} radians ({} degrees)".format(
            value, math.atan(value), math.degrees(math.atan(value))))
    elif choice != "0":
        print("\nInvalid choice.")

    if choice != "0":
        pause()


# Section 2: Hyperbolic functions
def hyperbolic_menu():
    print_header("HYPERBOLIC FUNCTIONS")
    print("""
    1. Compute sinh, cosh, tanh of a value
    2. Compute asinh, acosh, atanh of a value
    0. Back to Main Menu
""")
    choice = safe_input("Enter your choice:").strip()

    if choice == "1":
        x = get_float("Enter a value x:")
        print("sinh({}) = {}".format(x, math.sinh(x)))
        print("cosh({}) = {}".format(x, math.cosh(x)))
        print("tanh({}) = {}".format(x, math.tanh(x)))
    elif choice == "2":
        x = get_float("Enter a value x:")
        print("asinh({}) = {}".format(x, math.asinh(x)))
        try:
            print("acosh({}) = {}".format(x, math.acosh(x)))
        except ValueError:
            print("acosh(x) requires x >= 1.")
        try:
            print("atanh({}) = {}".format(x, math.atanh(x)))
        except ValueError:
            print("atanh(x) requires -1 < x < 1.")
    elif choice != "0":
        print("\nInvalid choice.")

    if choice != "0":
        pause()


# Section 3: Exponentiation and logarithms
def exponential_menu():
    print_header("EXPONENTIATION AND LOGARITHMS")
    print("""
    1. Show math.e and compute e^x
    2. Compute logarithms
    3. Compute powers
    0. Back to Main Menu
""")
    choice = safe_input("Enter your choice:").strip()

    if choice == "1":
        x = get_float("Enter x:")
        try:
            print("math.e = {}".format(math.e))
            print("e^{} = {}".format(x, math.exp(x)))
        except OverflowError:
            print("The result is too large to represent.")
    elif choice == "2":
        x = get_float("Enter a positive number x:")
        try:
            print("log({}) = {}".format(x, math.log(x)))
            print("log10({}) = {}".format(x, math.log10(x)))
            print("log2({}) = {}".format(x, math.log2(x)))
        except ValueError:
            print("Logarithms require x > 0.")
    elif choice == "3":
        x = get_float("Enter the base x:")
        y = get_float("Enter the exponent y:")
        try:
            print("pow({}, {}) = {}".format(x, y, pow(x, y)))
            print("math.pow({}, {}) = {}".format(x, y, math.pow(x, y)))
        except (ValueError, OverflowError):
            print("That power cannot be computed for the supplied values.")
    elif choice != "0":
        print("\nInvalid choice.")

    if choice != "0":
        pause()


# Section 4: General-purpose math functions
def general_menu():
    print_header("GENERAL-PURPOSE MATH FUNCTIONS")
    print("""
    1. Compute ceil, floor, and trunc of a value
    2. Compute a factorial
    3. Compute the hypotenuse of a right triangle
    0. Back to Main Menu
""")
    choice = safe_input("Enter your choice:").strip()

    if choice == "1":
        x = get_float("Enter a decimal number x:")
        print("ceil({}) = {}".format(x, math.ceil(x)))
        print("floor({}) = {}".format(x, math.floor(x)))
        print("trunc({}) = {}".format(x, math.trunc(x)))
    elif choice == "2":
        value = get_float("Enter a non-negative whole number:")
        if value < 0 or value != int(value):
            print("factorial requires a non-negative integer.")
        else:
            print("{}! = {}".format(int(value), math.factorial(int(value))))
    elif choice == "3":
        x = get_float("Enter the length of leg x:")
        y = get_float("Enter the length of leg y:")
        print("hypot({}, {}) = {}".format(x, y, math.hypot(x, y)))
    elif choice != "0":
        print("\nInvalid choice.")

    if choice != "0":
        pause()


# Section 5: The random module
def random_menu():
    print_header("THE RANDOM MODULE")
    print("""
    1. Set a seed
    2. Generate a number with randrange()
    3. Generate a number with randint()
    4. Pick a random item from a list
    5. Draw several unique items from a list
    0. Back to Main Menu
""")
    choice = safe_input("Enter your choice:").strip()

    if choice == "1":
        seed = get_float("Enter an integer seed:")
        random.seed(int(seed))
        print("Random seed set to {}.".format(int(seed)))
    elif choice == "2":
        start = int(get_float("Enter the start value:"))
        stop = int(get_float("Enter the stop value (exclusive):"))
        step = int(get_float("Enter the step:"))
        try:
            print("randrange result = {}".format(random.randrange(start, stop, step)))
        except ValueError:
            print("The range is invalid or contains no possible values.")
    elif choice == "3":
        low = int(get_float("Enter the lowest value:"))
        high = int(get_float("Enter the highest value:"))
        try:
            print("randint result = {}".format(random.randint(low, high)))
        except ValueError:
            print("The lowest value cannot be greater than the highest value.")
    elif choice in ("4", "5"):
        items = ["apple", "banana", "cherry", "date", "elderberry"]
        if choice == "4":
            print("Selected item: {}".format(random.choice(items)))
        else:
            count = int(get_float("How many items (1-5)?"))
            if 1 <= count <= len(items):
                print("Selected items: {}".format(random.sample(items, count)))
            else:
                print("Choose a number from 1 to {}.".format(len(items)))
    elif choice != "0":
        print("\nInvalid choice.")

    if choice != "0":
        pause()


def main():
    print("=" * 70)
    print("Welcome to the math and random module explorer")
    print("A learning tool for Python's math and random modules")

    while True:
        print("""
        MAIN MENU
        1. Trigonometric functions
        2. Hyperbolic functions
        3. Exponential and logarithmic functions
        4. General-purpose math functions
        5. Random module
        0. Exit program
        """)
        choice = safe_input("Enter your choice (0-5):").strip()

        if choice == "1":
            trig_menu()
        elif choice == "2":
            hyperbolic_menu()
        elif choice == "3":
            exponential_menu()
        elif choice == "4":
            general_menu()
        elif choice == "5":
            random_menu()
        elif choice == "0":
            print("Goodbye!")
            return
        else:
            print("\nInvalid choice.")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nProgram interrupted by user. Goodbye!")
    except SystemExit:
        pass
