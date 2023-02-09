try:
    from userdetails import app
    import unittest

except Exception as e:
    print("Data is incomplete {}".format(e))

class FlaskTest(unittest.TestCase):

    def test_index_content(self):
        tester = app.test_client(self)
        response = tester.get("/userdetails")
        self.assertEqual(response.content_type, "application/json")

    def test_index_code(self):
        tester = app.test_client(self)
        response = tester.get("/userdetails")
        statuscode = response.status_code
        self.assertEqual(statuscode, 200)

    def test_index_data(self):
        tester = app.test_client(self)
        response = tester.get("/userdetails")
        self.assertTrue(b'data' in response.data)


if __name__ == "__main__":
    unittest.main()
