json.status render(partial: "pages/booking_status", formats: :html, locals: { booking: @booking })
json.buttons render(partial: "pages/accept_reject_buttons", formats: :html, locals: { booking: @booking })
