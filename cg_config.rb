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
COURSE_ABBREV = '102'

# Lectures_schedule defines the schedule of lectures.
#
# This is primarily used to 1) figure out the time and date of each class,
# and 2) figure out the ordering of classes on the sidebar.

LECTURES_SCHEDULE_CONFIG = ScheduleDef.new(
  first_day: "aug-30-2024",
  weekdays: [:tuesday, :friday],
  start_times: ["11:10", "11:10"],
  end_times: ["12:30", "12:30"],
  number: 27,
  skips: ["oct-4-2024", "oct-11-2024", "oct-22-2024", "nov-29-2024"],
  start_time: "11:10",
  end_time: "12:30"
)

# T/F | 11:10 AM - 12:30 PM

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
HOME_PAGE = "/content/intro/15_syllabus-print.cg"

# Menulinks defines the links on the navigation bar.
# They are formatted as "Name" - "URL" pair.
#
# Examples:
#   %w[HOME /content/index.md]
#   %w[TOC /content/course_toc.md]
MENULINKS = [
  %w[MOODLE https://moodle.brandeis.edu/course/view.php?id=703],
  ["PREVIOUS YEARS", "https://drive.google.com/drive/u/1/folders/1C8VCqgV4VNxObFn4XuA-ql81HhCEn0f2"], ["BRANDEISPROJECTS", "http://pitosalas.github.io/brandeisprojects/"]
].freeze

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
