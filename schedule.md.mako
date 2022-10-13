---
layout: default
---

# Schedule

<%
import yaml

with open('schedule.yaml', 'r') as f:
    schedule = yaml.load(f.read(), Loader=yaml.FullLoader)

with open('papers.yaml', 'r') as f:
    papers = yaml.load(f.read(), Loader=yaml.FullLoader)

dates = (('friday', "Friday, October 14, 2022", "Witherspoon Student Center 201"),
         ('saturday', "Saturday, October 15, 2022", "Engineering Building 2, 1025"))

linebreak = '  \n'
%>


% for day, date, location in dates:
${'##'} ${f"{date}: {location}"}
% for session in schedule[day]:
${'###'} ${session['name']}
**Time: ${session['time']}**${linebreak}
% if 'chair' in session:
**Chair: ${session['chair']}**${linebreak}
% endif
% if 'title' in session:
**${session['title']}**${linebreak}
${session['abstract']}
% endif
% if 'talks' in session:
% for talk in session['talks']:
- **<a href="abstracts/${papers[talk]['pdf']}">${papers[talk]['title']}</a>**${linebreak} *by ${", ".join(papers[talk]['authors'])}*
% endfor
% endif
${'\n'}
---
% endfor
% endfor
