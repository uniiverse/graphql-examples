require 'spec_helper'

describe 'Ruby queries_viewer' do
  it 'works' do
    response_body = `ruby ruby/queries_viewer.rb`
    body = parse_json(response_body)

    expect(body[:data]).to eq(viewer: nil)
    expect(body[:errors]).to eq([
      message: "Must be authenticated to access viewer",
      locations: [line: 3, column: 5],
      path: ["viewer"]
    ])
  end
end
