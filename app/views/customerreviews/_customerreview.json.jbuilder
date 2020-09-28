json.extract! customerreview, :id, :customertype, :customername, :customeremail, :reviewrating, :reviewbody, :publish, :productid, :reviewid, :created_at, :updated_at
json.url customerreview_url(customerreview, format: :json)
