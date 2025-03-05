create table airport ( 
    id bigint primary key,
	airport_name varchar(50),
	country varchar(50),
	state varchar(50),
	city varchar(50),
	created_at timestamp,
	updated_at datetime
);


create table airline (
    id bigint primary key,
	airline_code varchar, 
	airline_name bigint, 
	airline_country varchar(50),
	created_at timestamp,
	updated_at datetime
);


create table passengers (
    id bigint primary key,
	first_name varchar(50),
	last_name varchar(50),
	date_of_birth date,
	country_of_citizenship varchar(50),
	country_of_residence varchar(50),
	passport_number varchar(20),
	created_at timestamp,
	updated_at datetime
);


create table flights (
    flight_id bigint primary key,
	departing_gate varchar(20),
	arriving_gate varchar(20),
	created_at timestamp,
	updated_at datetime,
	airline_id bigint,
	constraint FK_airline_id foreign key (airline_id)
	references airline(id),
	departing_airport_id bigint,
	constraint FK_departing_airport_id foreign key (departing_airport_id)
	references airport(id),
	arriving_airport_id bigint,
	constraint FK_arriving_airport_id foreign key (arriving_airport_id)
	references airport(id)
);


create table booking (
    bookingid bigint primary key,
	flight_id bigint,
	status varchar(20),
	booking_platform varchar(20),
	created_at timestamp,
	updated_at datetime,
	passenger_id bigint,
	constraint FK_passenger_id foreign key (passenger_id)
	references passengers(id)
);


create table flight_manifest (
    id bigint primary key,
	created_at timestamp,
	updated_at datetime,
	booking_id bigint,
	constraint FK_booking_id foreign key (booking_id)
	references booking(bookingid),
	flight_id bigint,
	constraint FK_flight_id foreign key (flight_id)
	references flights(flight_id)
);


create table no_fly_list (
   id bigint primary key,
   active_form date,
   active_to date,
   no_fly_reason varchar(255),
   created_at timestamp,
   updated_at datetime,
   psgnr_id bigint,
   constraint FK_psgnr_id foreign key (psgnr_id)
   references passengers(id)
);


create table baggage (
    id bigint primary key,
	weight_in_kg decimal(4,2),
	created_date timestamp,
	updated_date datetime,
	booking_id bigint,
	constraint FK_booking_id_baggage foreign key (booking_id)
	references booking(bookingid)
);


create table boarding_pass (
    id bigint primary key,
	qr_code varchar(8000),
	created_at timestamp,
	updated_at datetime,
	booking_id bigint,
	constraint FK_booking_id_boarding_pass foreign key (booking_id)
	references booking(bookingid)
);


create table baggage_check (
    id bigint primary key,
	check_result varchar(50),
	created_at bigint,
	updated_at bigint,
	booking_id bigint,
	constraint FK_booking_id_baggage_check foreign key (booking_id)
	references booking(bookingid),
	passenger_id bigint,
	constraint FK_passenger_id_baggage_check foreign key (passenger_id)
	references passengers(id)
);


create table security_check (
    id bigint primary key,
	check_result varchar(20),
	comments varchar(8000),
	created_at timestamp,
	updated_at datetime,
	passenger_id bigint,
	constraint FK_passenger_id_security_check foreign key (passenger_id)
	references passengers(id)
);



