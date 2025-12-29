"""
Sample tests
"""

from django.test import SimpleTestCase
import app.calc as calc


class CalcTests(SimpleTestCase):
    """Test the calc module"""

    def test_add(self):
        # Given
        a = 1
        b = 3

        # When
        result = calc.add(a, b)

        # Then
        self.assertEqual(result, 4)

    def test_substract(self):
        # Given
        a = 1
        b = 3

        # When
        result = calc.substract(a, b)

        # Then
        self.assertEqual(result, -2)
