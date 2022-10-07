from mako.template import Template
import os

path = os.path.dirname(__file__)
print(path)
schedule_mako_filename = os.path.join(path, "schedule.md.mako")
print(schedule_mako_filename)
schedule_md = Template(filename=schedule_mako_filename)

schedule_md_filename = os.path.join(path, "schedule.md")
with open('schedule.md', 'w') as f:
  f.write(schedule_md.render())
