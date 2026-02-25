# Seed data for daily log app

# Create emotions
emotions = [
  { name: 'Happy', color: '#FFD700' },
  { name: 'Sad', color: '#4169E1' },
  { name: 'Angry', color: '#DC143C' },
  { name: 'Excited', color: '#FF6347' },
  { name: 'Calm', color: '#90EE90' },
  { name: 'Anxious', color: '#FF69B4' },
  { name: 'Tired', color: '#808080' },
  { name: 'Motivated', color: '#00CED1' }
]

emotions.each do |emotion|
  Emotion.find_or_create_by!(name: emotion[:name], color: emotion[:color])
end

# Create tags
tags = [
  'Work', 'Personal', 'Health', 'Family', 'Friends', 'Learning', 'Project', 'Travel', 'Food', 'Exercise'
]

tags.each do |tag_name|
  Tag.find_or_create_by!(name: tag_name)
end

# Create sample user
user = User.find_or_create_by!(email: 'test@example.com')
user.password = 'password'
user.save!

# Create sample reports
if user.reports.empty?
  sample_reports = [
    {
      title: 'First day at new job',
      content: 'Started my new job today! Everyone was very welcoming and the office has a great atmosphere. Looking forward to learning new things.',
      emotion_id: Emotion.find_by(name: 'Excited')&.id,
      tags: ['Work', 'Learning']
    },
    {
      title: 'Weekend hike',
      content: 'Went on a beautiful hike this weekend. The weather was perfect and the views were amazing. Feeling refreshed and connected with nature.',
      emotion_id: Emotion.find_by(name: 'Happy')&.id,
      tags: ['Personal', 'Health', 'Travel']
    },
    {
      title: 'Project deadline',
      content: 'Submitted the project before the deadline! It was challenging but I learned a lot. Team collaboration was excellent.',
      emotion_id: Emotion.find_by(name: 'Motivated')&.id,
      tags: ['Work', 'Project']
    }
  ]

  sample_reports.each do |report|
    user.reports.create!(report)
  end
end

puts "Seed data created successfully!"