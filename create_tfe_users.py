import mechanize
ptfe = 'https://workshop.ric.aws.hashidemos.io'
url_new_acct = ptfe + '/account/new'
number_of_students = 10

for number in range(1, number_of_students + 1):
    br = mechanize.Browser()
    br.set_handle_robots(False) # ignore robots
    br.open(url_new_acct)
    br.select_form(class_=lambda x: 'new_user' in x)
    br["user[username]"] = "student{:0>2d}".format(number)
    br["user[email]"]= "student{:0>2d}@temp.com".format(number)
    br["user[password]"] = "workshop01"
    br["user[password_confirmation]"] = "workshop01"
    res = br.submit()
    content = res.read()
    # print (content)
