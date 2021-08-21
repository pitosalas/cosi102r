# frozen_string_literal: true

# Coursegen configuration file.
#
# Note that in order to read the configuration file, this file must be at the
# root of the course directory.
require 'coursegen'

# AUTHOR
AUTHOR_NAME = 'R. Pito Salas'
AUTHOR_EMAIL = 'rpsalas@brandeis.edu'
COPYRIGHT_STRING = "Copyright (2013-#{Time.now.year}) #{AUTHOR_NAME}, #{AUTHOR_EMAIL}"

# Bucket Deployment of the course
AWS_BUCKET = "cosi102r"

# COURSE
COURSE_SHORT_NAME = 'Cosi102'
COURSE_LONG_NAME = 'Software Entrepreneurship'
COURSE_ABBREV = 'SE'

# Lectures_schedule defines the schedule of lectures.
#
# This is primarily used to 1) figure out the time and date of each class,
# and 2) figure out the ordering of classes on the sidebar.

LECTURES_SCHEDULE_CONFIG = ScheduleDef.new(
  first_day: "aug-26-2021",
  weekdays: [:tuesday, :thursday],
  start_times: ["16:00", "16:00"],
  end_times: ["17:30", "17:30"],
  number: 28,
  skips: [],
  start_time: "16:00",
  end_time: "17:30"
)

# Section_config defines the structure of the course.
#
# Each section is defined by
#   title     name of the section
#   selector  directory of the section (under /content)
#   type      type of the section (:section or :lecture)
#   schedule  schedule of the lecture (only needed for :lecture)
#
# Additionally, you can choose to hide the section on the sidebar by setting
# hidden: true.
SECTION_CONFIG = [
  SectionDef.new("Intro", "intro", type: :section, collapsed: false, bullet: :star),
  SectionDef.new("Lectures", "lectures",
                 type: :lecture, schedule: LECTURES_SCHEDULE_CONFIG, bullet: :dash),
  SectionDef.new("Homework", "homework", hidden: true, type: :section),
  SectionDef.new("Course Resources", "background", type: :section, collapsed: false, bullet: :star),
  SectionDef.new("Topics", "topics", hidden: true, type: :section),
  SectionDef.new("Extras", "extras", hidden: true, type: :section)
].freeze

# SITE
#
# The URL of the deployed site.
# Please include any http or https prefix.
SITE_URL = "http://cosi102r.s3-website-us-east-1.amazonaws.com"

# Home_page sets the home page of the site.
# This is usually /content/index.md.erb.
#
# Note: the .erb suffix is required when setting the HOME_PAGE path.
HOME_PAGE = "/content/intro/10_syllabus.md.erb"

# Menulinks defines the links on the navigation bar.
# They are formatted as "Name" - "URL" pair.
#
# Examples:
#   %w[HOME /content/index.md]
#   %w[TOC /content/course_toc.md]
MENULINKS = [%w[lectures /content/intro/20_coursetoc.md/],
            %w[homeworks /content/intro/40_weeks.md/],
          %w[latte https://moodle2.brandeis.edu/course/view.php?id=20376]].freeze

# Helpful_box provides a feedback box on the sidebar.
#
# DO NOT USE. This is currently not functional.
HELPFUL_BOX = false

# STYLING
#
# Options:
#   bullet_style: css style for each bullet
STYLING_CONFIG = {
  bullet_style: '"font-size: 60%; width: 10px; color: grey"'
}.freeze

# SEARCH
#
# Coursegen uses DocSearch by Algolia (https://docsearch.algolia.com/) to
# provide site-wide full-text search functionality.
#
# In order for search to function, you need to replace with your own
# search API key, and name of your index from Algolia.
# For details, please refer to https://github.com/pitosalas/coursegen/blob/master/README.md.
SEARCH_CONFIG = {
  api_key: '855a55e631c6523e8201162e6d9c1e9c',
  index_name: 'cosi102r',
  # APP_ID is only used if you are running DocSearch on your own.
  app_id: '',
  debug: false
}.freeze

# SLIDES
SLIDES_CONFIG = {
  # Ignore_selectors ignore certain html elements from rendering in the slides.
  ignore_selectors: ['li ul'],

  # Reveal.js specific options
  # See: https://revealjs.com/config/
  revealjs_opts: {
    transition: 'slide'
  }
}.freeze
