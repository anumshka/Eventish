CREATE TABLE event(
	event_id SERIAL PRIMARY KEY,
	event_name  VARCHAR(100),
	event_type VARCHAR(20),
	event_category VARCHAR(50),
	venue VARCHAR(200),
	event_date date,
	event_time time,
	registration_fees NUMERIC,
	registration_form VARCHAR(200),
	description VARCHAR(5000)	
);

INSERT INTO event( event_name,event_type,event_category,venue,event_date,event_time,registration_fees,
				  registration_form,description)

VALUES 
('Bengaluru Tech Summit','Online','Technology','Google Meet','2021-11-17','17:00:00',1000,NULL,
 'Bengaluru Tech Summit is a gathering foreground for all those who thrive on businesses that leverage technology');
 
INSERT INTO event( event_name,event_type,event_category,venue,event_date,event_time,registration_fees,
				  registration_form,description);

VALUES 
('TechnoXian EduTech Expo','Online','Technology','Google Meet','2021-10-23','18:00:00',1500,NULL,
 'A Creative Platform For You To Learn, Explore And Share Your Knowledge On Robotics & Automation'),
 
 ('IndiaFirst Tech Start Up','Online','Technology','Zoom','2021-11-18','14:00:00',0,NULL,
 'IndiaFirst Tech Start-up series is an initiative of AICRA to encourage technology startups and AICRA members to work together and create partnerships that is beneficial to both the stakeholders'),
 
 ('Swaraag Live at Saga ','Offline','Cultural','Saga – Cuisines of India, Vatika Atrium, Sector 53, Golf course Road, Gurugram (Gurgaon), NCR 122022, India.','2021-08-20','20:00:00',1000,NULL,
 'Swaraag is a Rajasthani Folk fusion band that will be performing at Saga restaurant in Gurugram. The band is known for bringing the traditional tunes of Rajasthani music and mixing them with modern musical instruments to create a soothing fusion.'),
 
 ('Kumbhalgarh Festival','Offline','Cultural','Kumbhalgarh Fort Of Udaipur','2021-12-01','09:00:00',700,NULL,
 'This festival is celebrated as a cultural celebration. You can find all kinds of cultural activities during this festival. This festival takes place for three days and each day is unique. As the name indicated, this festival is celebrated near Kumbhalgarh Fort'),
 
 ('PCMA Convening Leaders','Online','Business','Zoom','2021-12-13','13:00:00',1000,NULL,
 'The Convening Leaders Conference is the best place for business events professionals to spark innovative ideas and gain insights from industry leaders'),
 
 ('IMEX America','Offline','Business',' Las Vegas, Nevada','2021-11-09','15:00:00',3500,NULL,
 'IMEX America is the global conference for incentive travel, meetings, and events. Featuring powerful educational sessions tailored to attendee learning preferences, ground-breaking keynotes from industry experts, and endless opportunities to connect with like-minded peers,'),
 
 ('Startup Meetup @ Delhi','Offline','Fundraising','Barakhamba, New Delhi','2021-10-09','12:00:00',299,NULL,
 'Fundraising Startup Meetup organized by StartupNews.fyi for Startups, where Startups come to meet, pitch, share and discuss issues and problems & NETWORK'),
 
 ('Toy Donations for Children','Offline','Fundraising','Rajkot, India','2021-11-14','09:00:00',50,NULL,
 'Do you want to donate toys? how many toys do you have? We do collections of working and non-working toys. '),
 
 ('The World Without Racism;','Online','Community','Zoom','2021-10-09','08:00:00',400,NULL,
 'The World Without Racism is born out of the desire to see an end to racism in our lifetime. Author, Eleadah R. Clack shares her experiences from a sociological multi-perspective and a workshop about the solutions that White allies can play to remove social issues in the United States. She tells us what communities and individuals can do to end racism in this generation.'),
 
 ('Internet of Things India expo','Offline','Technology','New Delhi, India','2022-03-24','09:00:00',2500,NULL,
 'New Delhi. Industry leaders will converge at IoT India 2022 expo to impact global industry trends, demonstrate the latest solutions and highlight viable opportunities.');
