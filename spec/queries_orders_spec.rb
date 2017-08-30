require 'spec_helper'

describe 'queries_orders' do
  it 'works with Ruby' do
    response_body = `ruby ruby/queries_orders.rb`
    body = parse_json(response_body)

    expect(body[:data]).to eq(event: {orders: nil})
    expect(body[:errors]).to eq([
      message: "Not authorized to access Event.orders",
      locations: [line: 3, column: 7],
      path: ["event", "orders"]
    ])
  end

  it 'works with cURL' do
    response_body = `./curl/queries_orders.sh`
    body = parse_json(response_body)

    expect(body[:data]).to eq(event: {orders: nil})
    expect(body[:errors]).to eq([
      message: "Not authorized to access Event.orders",
      locations: [line: 1, column: 70],
      path: ["event", "orders"]
    ])
  end
end
