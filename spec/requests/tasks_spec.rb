require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  # initialize test data 
  let!(:tasks) { create_list(:task, 10) }
  let(:task_id) { tasks.first.id }

  # Test suite for GET /tasks
  describe 'GET /tasks' do
    # make HTTP get request before each example
    before { get '/tasks' }

    it 'returns tasks' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /tasks/:id
  describe 'GET /tasks/:id' do
    before { get "/tasks/#{task_id}" }

    context 'when the record exists' do
      it 'returns the task' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(task_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:task_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Task/)
      end
    end
  end

  # Test suite for POST /tasks
  describe 'POST /tasks' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', status: 'Pending', priority: 'Medium' } }

    context 'when the request is valid' do
      before { post '/tasks', params: valid_attributes }

      it 'creates a task' do
        expect(json['name']).to eq('Learn Elm')
        expect(json['status']).to eq('Pending')
        expect(json['priority']).to eq('Medium')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/tasks', params: {  name: 'Learn Elm' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Status can't be blank/)
      end
    end
  end

  # Test suite for PUT /tasks/:id
  describe 'PUT /tasks/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/tasks/#{task_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /tasks/:id
  describe 'DELETE /tasks/:id' do
    before { delete "/tasks/#{task_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'GET /tasks/completed' do
    before { get "/tasks/completed" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return list of all completed tasks' do 
      expect(json).not_to be_empty
    end
  end
end