class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  # check wheter version is specified or is default
  def matches?(request)
    check_headers(request.headers) || default
  end

  private

  def check_headers(headers)
    # check version from Accept headers; expect custom media type 'parks'
    accept = headers[:accept]
    accept && accept.include?("application/vnd.parks.#{version}+json")
  end
end