return if Rails.env.production?

admin = AdminUser.
  create_with(password: 'password', password_confirmation: 'password').
  find_or_create_by!(name: 'Admin', email: 'admin@example.com')

single_type = AccommodationType.find_or_create_by!(
  name: "Single")

double_type = AccommodationType.find_or_create_by!(
  name: "Double")

airbnb_contact_source     = ContactSource.find_or_create_by!(name: 'AirBnb')
olx_contact_source        = ContactSource.find_or_create_by!(name: 'OLX')
google_contact_source     = ContactSource.find_or_create_by!(name: 'Google')
facebook_contact_source   = ContactSource.find_or_create_by!(name: 'Facebook')
instagram_contact_source  = ContactSource.find_or_create_by!(name: 'Instagram')
customer_contact_source   = ContactSource.find_or_create_by!(name: 'Customer reference')

flat_101 = Accommodation.find_or_create_by!(
  title:        "Flat 101",
  description:  "Two environments and two single beds",
  accommodation_type: single_type,
  available:    true,
  daily_value:  100.0)

flat_102 = Accommodation.find_or_create_by(
  title:        "Flat 102",
  description:  "One environment and two single beds",
  accommodation_type: single_type,
  available:    true,
  daily_value:  95.0)

flat_201 = Accommodation.find_or_create_by(
  title:        "Flat 201",
  description:  "One environment and double bed",
  accommodation_type: single_type,
  available:    true,
  daily_value:  110.0)

flat_202 = Accommodation.find_or_create_by(
  title:        "Flat 202",
  description:  "Two environments and two double beds",
  accommodation_type: double_type,
  available:    true,
  daily_value:  125.0)

jhon_doe = Customer.create_with(
  address_attributes: {
    zip_code:     "60336-051",
    street:       "Travessa Tenente José Barreira",
    neighborhood: "Álvaro Weyne",
    city:         "Fortaleza",
    state:        "CE",
    country:      "Brasil"
  }).
  find_or_create_by(
    name:     "Jhon Doe",
    email:    "jhon@doe.com",
    document: "84497717062",
    phone:    "86999993333",
    contact_source: olx_contact_source)

joshua_melv = Customer.create_with(
  address_attributes: {
    zip_code:     "68901-019",
    street:       "Avenida Antonio Gonçalves Tocantins",
    neighborhood: "Trem",
    city:         "Macapá",
    state:        "AP",
    country:      "Brasil"
  }).
  find_or_create_by(
    name:     "Joshua Melv",
    email:    "joshua@melv.com",
    document: "47302600074",
    phone:    "86977772222",
    contact_source: instagram_contact_source)

sr_madruga = Customer.create_with(
  address_attributes: {
    zip_code:     "41300-120",
    street:       "Rua George Bonnete",
    neighborhood: "Valéria",
    city:         "Salvador",
    state:        "BA",
    country:      "Brasil"
  }).
  find_or_create_by(
    name:     "Senhor Madruga",
    email:    "madrugao@example.com",
    document: "51759259039",
    phone:    "86933331111",
    contact_source: airbnb_contact_source)

standford_pines = Customer.create_with(
  address_attributes: {
    zip_code:     "68901-019",
    street:       "Avenida Antonio Gonçalves Tocantins",
    neighborhood: "Trem",
    city:         "Macapá",
    state:        "AP",
    country:      "Brasil"
  }).
  find_or_create_by(
    name:     "Stanford Pines",
    email:    "stan_pines@example.com",
    document: "06113183009",
    phone:    "11432519837",
    contact_source: customer_contact_source)

Reservation.find_or_create_by!(
  customer_id:      jhon_doe.id,
  accommodation_id: flat_101.id,
  check_in:         3.days.ago,
  check_out:        3.days.from_now,
  num_guests:       1,
  payment_method:   "transferência bancária",
  contact_source:   olx_contact_source,
  paid:             true,
  author:           admin)

Reservation.find_or_create_by!(
  customer_id:      joshua_melv.id,
  accommodation_id: flat_102.id,
  check_in:         4.days.from_now,
  check_out:        15.days.from_now,
  num_guests:       1,
  payment_method:   "transferência bancária",
  contact_source:   instagram_contact_source,
  paid:             true,
  author:           admin)

Reservation.find_or_create_by!(
  customer_id:      sr_madruga.id,
  accommodation_id: flat_201.id,
  check_in:         20.days.ago,
  check_out:        10.days.ago,
  num_guests:       2,
  payment_method:   nil,
  contact_source:   airbnb_contact_source,
  paid:             false,
  author:           admin)

Reservation.find_or_create_by!(
  customer_id:      standford_pines.id,
  accommodation_id: flat_202.id,
  check_in:         30.days.from_now,
  check_out:        45.days.from_now,
  num_guests:       3,
  payment_method:   nil,
  contact_source:   google_contact_source,
  paid:             false,
  author:           admin)
