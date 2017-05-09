require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/survey'
require './lib/question'
require 'pry'

also_reload 'lib/**/*.rb'

get '/' do
  @surveys = Survey.all
  erb :index
end

post '/survey/new' do
  title = params.fetch 'survey-title'
  @survey = Survey.create({title: title})
  erb :survey_builder
end

get '/survey/build/:id' do
  @survey = Survey.find(params.fetch('id').to_i)
  erb :survey_builder
end

post '/survey/create' do
  prompt = params.fetch 'prompt'
  option1 = params.fetch 'option1'
  option2 = params.fetch 'option2'
  option3 = params.fetch 'option3'
  option4 = params.fetch 'option4'
  survey_id = params.fetch 'survey_id'
  Question.create({prompt: prompt, answer1: option1, answer2: option2, answer3: option3, answer4: option4, survey_id: survey_id})
  @survey = Survey.find(survey_id)
  erb :survey_builder
end

get '/survey/:id' do
  @survey = Survey.find(params.fetch('id').to_i)
  @question_ids = @survey.questions.ids
  erb :survey
end

patch('/update_survey/:id') do
  title = params.fetch("survey-title")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({title: title})
  redirect "/survey/#{@survey.id}"
end



delete('/delete_survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete
  redirect '/'
end

post '/survey/submit' do
  binding.pry
  answer1 = params.fetch "#{@question_ids}"
  answer2 = params.fetch "#{@question_ids}"
  answer1 = params.fetch "#{@question_ids}"
  answer1 = params.fetch "#{@question_ids}"
  # user.create()
  erb :success
end
