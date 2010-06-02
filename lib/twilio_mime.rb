# TwilioMime

Mime::Type.register_alias "text/html", :twilio

class ActionController::Base

    before_filter :set_twilio_format
    
    def set_twilio_format
      if is_twilio_request?
        request.format = :twilio
      end
    end

private

  def is_twilio_request?
    
    if defined?(TWILIO_ACCOUNT_GUID)
      return params["AccountGuid"] == TWILIO_ACCOUNT_GUID || params["AccountSid"] == TWILIO_ACCOUNT_GUID
    else
      return (params.include?("AccountSid") && params.include?("SmsSid")) || (params.include?("AccountGuid") && params.include?("CallGuid"))
    end
    
  end
  
end