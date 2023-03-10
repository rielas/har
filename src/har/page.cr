module HAR
  class Page
    include JSON::Serializable

    # Date and time stamp for the beginning of the page load
    # (ISO 8601 - `YYYY-MM-DDThh:mm:ss.sTZD`, e.g. `2009-07-24T19:20:30.45+01:00`).
    @[JSON::Field(key: "startedDateTime", converter: HAR::TimeConverter)]
    property started_date_time : Time | String?

    # Unique identifier of a page within the `Log`.
    # `Log#entries` use it to refer to the parent page.
    property id : String?

    # Page title.
    property title : String?

    # Detailed timing info about page load.
    @[JSON::Field(key: "pageTimings")]
    property page_timings : PageTimings?

    # A comment provided by the user or the application.
    property comment : String?

    def initialize(
      @started_date_time = nil,
      @id = nil,
      @title = nil,
      @page_timings = nil,
      @comment = nil
    )
    end
  end
end
