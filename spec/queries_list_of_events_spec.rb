require 'spec_helper'

describe 'queries_list_of_events' do
  it 'works with Ruby' do
    response_body = `ruby ruby/queries_list_of_events.rb`
    body = parse_json(response_body)

    expect(body[:errors]).to eq(nil)
    expect(body.dig(:data, :host, :name)).to eq('Joshua Kelly')
    expect(body.dig(:data, :host, :events, :totalCount)).to be >= 1
    expect(body.dig(:data, :host, :events, :nodes).map { |node| node[:id] }).to include('5879ad8f6672e70036d58ba5')
    expect(body.dig(:data, :host, :events, :nodes).map { |node| node[:title] }).to include('End of Unix Time')
  end

  it 'works with cURL' do
    response_body = `./curl/queries_list_of_events.sh`
    body = parse_json(response_body)

    expect(body[:errors]).to eq(nil)
    expect(body.dig(:data, :host, :name)).to eq('Joshua Kelly')
    expect(body.dig(:data, :host, :events, :totalCount)).to be >= 1
    expect(body.dig(:data, :host, :events, :nodes).map { |node| node[:id] }).to include('5879ad8f6672e70036d58ba5')
    expect(body.dig(:data, :host, :events, :nodes).map { |node| node[:title] }).to include('End of Unix Time')
  end
end
