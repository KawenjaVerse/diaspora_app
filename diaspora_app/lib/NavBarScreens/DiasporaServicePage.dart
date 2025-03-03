
import 'package:flutter/material.dart';

import '../Home/ServiceDetails.dart';
import 'DiasporaRegistrationPage.dart';
import 'NationalIDPage.dart';
import 'PassportPage.dart';
import 'ServiceDetailsPage.dart';
import 'VisaPage.dart';

class DiasporaServicePage extends StatefulWidget {
  const DiasporaServicePage({super.key});

  @override
  State<DiasporaServicePage> createState() => _DiasporaServicePageState();
}

class _DiasporaServicePageState extends State<DiasporaServicePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Services', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF5C23),
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          labelColor: Colors.white,
          controller: _tabController,
          tabs: const [
            Tab(text: "Diaspora Services"),
            Tab(text: "Consular Services"),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDiasporaServices(),
          _buildConsularServices(),
        ],
      ),
    );
  }

  Widget _buildDiasporaServices() {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        _buildServiceCard(
          imagePath: 'assets/images/diasp.jpg',
          title: 'Diaspora Registration',
          description: 'Diaspora Registration',
          onReadMore: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DiasporaRegistrationPage()));
          },
        ),
        _buildServiceCard(
          imagePath: 'assets/images/immg.jpg',
          title: 'Visas',
          description: 'New Application',
          onReadMore: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => VisaPage()));
          },
        ),
        _buildServiceCard(
          imagePath: 'assets/images/pssprt.jpg',
          title: 'Passports',
          description: 'Apply, Renew',
          onReadMore: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PassportPage()));
          },
        ),
        _buildServiceCard(
          imagePath: 'assets/images/nat.jpg',
          title: 'National ID',
          description: 'National ID Appointment',
          onReadMore: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NationalIDPage()));
          },
        ),
      ],
    );
  }

  Widget _buildConsularServices() {
    final List<Map<String, String>> services = [
      {"title": "Adoption of children in Uganda", "description": '''
Adoption of Children in Uganda
US citizens are advised to visit the website site of the US Department of State and in particular, the link to Inter-country Adoption.

In addition, you may wish to get in touch with a local attorney in Uganda who should be able to assist you through the process.

Uganda's Law on adoption "The Children Act"

Requirements for Registration of a completed Adoption with the Embassy.

A Copy of the court judgment granting the adoption.
A Copy of the adoptive parent's photo IDs.
A Current photo of the child clearly showing facial features.
The Full address in the US where the child will reside.
The Children Act

      
      '''},
      
      
      {"title": "Citizenship and Dual Citizenship", "description": '''
CITIZENSHIP

DEFINITION OF A CITIZEN OF UGANDA

Chapter 3 Articles 9-12 of the 1995 Constitution as amended states that

Article 9 - Citizenship by default Every person who, on the commencement of the 1995 Constitution, was a citizen of Uganda shall continue to be such a citizen.

Article 10 - Citizenship by birth/descent The following persons shall be citizens of Uganda by birth- (a) every person born in Uganda one of whose parents or grandparents is or was a member of any of the indigenous communities existing and residing within the borders of Uganda as at the first day of February, 1926 and set out in the Third Schedule to this Constitution; and (b) every person born in or outside Uganda one of whose parents or grandparents was at the time of birth of that person a citizen of Uganda by birth.

Article 11 - Foundlings and adopting children (1) A child of not more than five years of age found in Uganda, whose parents are not known, shall be presumed to be a citizen of Uganda by birth. (2) A child under the age of eighteen years neither of whose parents is a citizen of Uganda, who is adopted by a citizen of Uganda shall, on application, be registered as a citizen of Uganda.

Article 12 - Citizenship by registration (1)Every person born in Uganda- (a) at the time of whose birth- (i) neither of his or her parents and none of his or her grandparents had diplomatic status in Uganda; and (ii) neither of his or her parents and none of his or her grandparents was a refugee in Uganda; and (b) who has lived continuously in Uganda since the ninth day of October, 1962. shall, on application, be entitled to be registered as a citizen of Uganda- (2) The following persons shall, upon application be registered as citizens of Uganda- (a) every person married to a Uganda citizen upon proof of a legal and subsisting marriage of three years or such other period prescribed by Parliament: (b) every person who has legally and voluntarily migrated to and has been living in Uganda for at least ten years or such other period prescribed by Parliament; (c) every person who, on the commencement of this Constitution, has lived in Uganda for at least twenty years. (3) Paragraph (a) of clause (2) of this article applies also to a person who was married to a citizen of Uganda who, but for his or her death, would have continued to be a citizen of Uganda under this Constitution. (4) Where a person has been registered as a citizen of Uganda under paragraph (a) of clause(2)of this article and the marriage by virtue of which that person was registered is- (a) annulled or otherwise declared void by a court or tribunal of competent jurisdiction; or (b) dissolved, that person shall, unless he or she renounces that citizenship, continue to be a citizen of Uganda.

Article 13 Citizenship by naturalization Parliament shall by law provide for the acquisition and loss of citizenship by naturalization. Loss of citizenship by registration Click here to start your application for Citizenship by naturalization

LOSS OF CITIZENSHIP

Article 14 A person may be deprived of his or her citizenship if acquired by registration,on any of the following grounds- (a) voluntary acquisition of the citizenship of another country; (b) voluntary service in the armed forces or security forces of a country hostile to, or at war with Uganda; (c) acquisition of Uganda citizenship by fraud, deceit, bribery, or having made intentional and deliberate false statements in his or her application for citizenship; and (d)espionage against Uganda.

Where the law of a country other than Uganda,requires a person who marries a citizen of that country to renounce the citizenship of his or her own country by virtue of that marriage, a citizen of Uganda who is deprived of his or her citizenship by virtue of that marriage shall, on the dissolution of that marriage, if he or she thereby loses his or her citizenship acquired by that marriage, become a citizen of Uganda

DUAL CITIZENSHIP

In Uganda, dual citizenship means the simultaneous possession of two citizenship's of which one is Uganda. The possession of a third citizenship disqualifies one from holding or being a dual national of Uganda unless the third citizenship is renounced.

Until 2009, dual citizenship was prohibited in Uganda by Article 15 of the Constitution. Article 15 was amended by constitutional amendment No . Pursuant to which the Uganda Citizenship and Immigration Control (Amendments) Act 2009 was enacted providing for dual citizenship in Uganda.

The amendment was passed following the realization that Ugandans in the Diaspora make enormous contribution to the economic and socio-development of Uganda and the Government's need to:

i.    enable Ugandans in the Diaspora maintain linkages with their roots without any legal hindrances

ii.   Attract potential investors

iii.    Reap advantages that accrue from the grant of dual citizenship.

Conditions for dual citizenship are detailed in the Uganda Citizenship and ImmigrationControl (Amendment) Act 2009. All Ugandans who lost their Ugandan citizenship prior to 2009 by way of obtaining citizenship of another country can now reacquire their former Ugandan citizenship. Ugandans who desire to acquire citizenship of another country can also do so without losing their Ugandan citizenship.

A citizen of Uganda of eighteen years and above who voluntarily acquires citizenship of another country may retain the citizenship of Uganda subject to the Constitution (of Uganda), the Citizenship and Immigration Act, and any law enacted by Parliament.

A person who is not a citizen of Uganda may, on acquiring the citizenship of Uganda, subject to the Constitution, the Citizenship and Immigration Act and any other law enacted by Parliament, retain the citizenship of another country.

WHO QUALIFIES TO HOLD DUAL CITIZENSHIP IN UGANDA?

i.    Any person holding Uganda citizenship and seeks citizenship of another country that allows dual citizenship and also fulfills the requirements for dual nationality OR

ii.    Any person who holds a citizenship of a country that permits dual nationality and also seeks Uganda citizenship and satisfies the requirements for grant of dual citizenship.

PROCEDURES FOR RETAINING THE CITIZENSHIP OF UGANDA WHEN ONE ACQUIRES CITIZENSHIP OF ANOTHER COUNTRY?

i.    A citizen of Uganda who desires to acquire the citizenship of another country while retaining his/her citizenship of Uganda shall give notice in writing to the National Citizenship and Immigration Board of his or her application for the citizenship of another country

ii.    The notice above shall be in the prescribed form and shall be accompanied by:
a.    A statutory declaration stating that he or she is a citizen of Uganda only  where the person is a citizen of Uganda and another country, a declaration of renunciation of the Citizenship of the third country evidence that the applicant is of or above eighteen years of age.
b.    A copy of the application for citizenship of that other country.
c.    Any other relevant information

OFFICES IN UGANDA WHICH CAN NOT BE HELD BY A DUAL CITIZEN

a)     President of Uganda

b)    Vice President

c)     Prime Minister

d)    Cabinet Minister and other Ministers

e) Inspector General and the Deputy Inspector General of Government

f) Technical Head of the armed forces
    
g) Technical heads of Branches of the armed forces
         
h) Commanding Officers of armed forces units of at least battalion strength
    
i) Officers responsible for heading departments responsible for records, personnel and logistics in all branches of the armed forces
    
j) Inspector General of Police and Deputy Inspector General of Police
   
k) Heads and Deputy Heads of National Security and Intelligence Organizations,(ESO, ISO & CMI)
    
l) Member of the National Citizenship and Immigration Board

SUMMARY CHECK LIST FOR DUAL CITIZENSHIP APPLICANTS

a) Duly completed dual citizenship application form and have it commissioned or Notarized by a High Court Judge or Notary Public.

b)  Cover letter addressed to the secretary of the National citizenship and Immigration Board
c)  Letter of good conduct from the home country or Interpol.

d)    Proof that the applicant has been granted citizenship by registration ( only applicable to foreigners who have been granted Ugandan Citizenship by Registration).
e)    Evidence that the second country other than Uganda allows dual citizenship (e.g. letter from immigration authority or High Commission or consulate of that other country or copy of the provisions of laws permitting dual citizenship of that other country ).
f)    Two (2) recent Passport size photos of applicant.
g)    Evidence that the applicant or his/her parents or grandparents have ever resided in Uganda for at least ten years.
h)    Medical report of sanity of the applicant.
i)    Proof that the applicant is above 18 years of age e.g.birth certificate.
j)    Evidence that the applicant has adequate knowledge of English, Swahili or
k)    Evidence that the applicant was formerly a Ugandan (only applicable to Ugandans in the Diaspora ).

l)   Any of the prescribed vernacular languages.
'''},
     
      {"title": "Emergency Travel Documents", "description": '''
Emergency Travel Documents
Requirements for an Emergency Travel document

1. Form G

2. A copy of your bio-data page of the expired passport

3. A copy of your travel itinerary

4. Two passport pictures

5. A money order of 50.00 made payable to Uganda Embassy

6. A pre-paid self addressed return envelope

7. A cover letter requesting the Emergency travel document
''',"document":"assets/iamges/form.pdf"},
     
     
      {"title": "Accreditation of Members of Foreign Press", "description": '''
Accreditation of Members of Foreign Press
An employee of a foreign mass media organization or working as a freelancer for that mass media who intends to practice journalism in Uganda must obtain an accreditation card issued by the Uganda Media Council. The procedure for obtaining an accreditation card is as follows:

PROCEDURE:

(I) A letter from an employer to The Executive Director Uganda Media Centre/ Secretary Media Council stating the purpose of visit.
(II) Two-passport size photographs and a Scanned Copy of your Passport Can be attached physically or electronically.
(III) Form G is filled stating the particulars of the applicant. Download Form G from the Bottom of this Page

On approval by the Secretary to the Media Council of Uganda,
a fee of US175 per person is paid for a period not exceeding 30 days of the journalist’s stay.
a fee of US225 per person is paid for a period beyond 30 days up to six months of stay.
a fee of US325 per person is paid for a period of two years. Refer to the Press and Journalist (Fees) Regulations, 2014.
''', "document":"assets/iamges/form.pdf"
},
      
      {"title": "National ID", "description": '''
The National ID registration and Issuance  center at the Embassy has fully reopened for national ID Enrollment at the following times:

REGISTRATION SERVICES

Monday -  Friday  10:00am - 3:00pm  by Appointment

ISSUANCE OF READY FOR COLLECTION N.IDs SERVICE

Monday -  Friday 10.00am - 2.00pm  Appointment not required. (NB: Out of State Residents are strongly advised to make an appointment)  

Note:  Renewals of N.IDs SERVICE is conducted by NIRA at the Head Office in Kampala, Kololo Airstrip.

Due to the COVID-19 outbreak and as per Federal Guidelines for staff safety and to do our part in containing the spread of the outbreak. For the health and safety of our staff we request that only applicants or clients receiving services access the building.

UGANDA NATIONAL IDENTITY CARD

The Uganda National Identification Card is a National document that is issued to all and only citizens of Uganda of or above the age of 18 years. The Card is a bio-metrically enhanced, machine readable card with digitally embedded information about the holder. One's information can ONLY be accessed by law. The holder is required or encouraged to carry it as a means of confirming their identity where the need arises. The identification system uses bio-metric techniques such as the fingerprint and facial recognition to confirm the identity of the card holder

Every Ugandan citizen has the right to have National Identity card and registration is not delegate-able. Mass registration started across the country in 2015 and every citizen is required to register in their respective place of birth or residence to enable the process of information gathering.


 

Please note that this application can not be done online. Every applicant must register for their Identity Card in person and collect it in person. The major safeguards when you enroll for an identity card will be your finger prints, facial features, etc. No one can be able to capture your fingerprints in your absence.

New security features of the National ID

Many of the design features on your identity card comply with international standards so that it can even be used as a travel document within the East African Region. The card has a card number printed on it as well as a unique National Identification Number (NIN). The card contains different security features and your personal information including names, signature, photo, and fingerprints among others as illustrated.


Uganda citizenship is a question of law and fact. For one to be issued with a National Identification Number (NIN) and National Identity Card, they must be verified and approved as citizens of Uganda. Different types of citizenship (birth/descent, naturalization/registration, Dual Citizen) may call for different documents to prove different facts as maybe required under Uganda citizenship laws. Please present documents as per the kind of citizenship you hold:

APPLICANTS MUST PRESENT THE FOLLOWING DOCUMENTS FOR REGISTRATION:

i. A duly completed NIRA form 3 to be issued to you at the Embassy

ii. carry and submit the following supporting documents to prove citizenship:

1) Citizens by birth/descent

Citizens of Uganda by birth must present the following requirements:

Ugandan Passport
Birth certificate
Photo Copy of National ID of one or both parents (If deceased or do not have National IDs, present National ID copy of a blood relative i.e Uncle, Auntie or older Sibling).

2) Dual Citizenship

Certified copy of certificate of Dual Citizenship
Passport of current country of residence.

3) Citizens by Registration

Certified copy of Certificate of Citizenship by registration issued by National Citizenship and Immigration Control Board (NCIB)
Identification bearing applicant's photo

4) Naturalization

Certified copy of Certificate of Naturalization as Ugandan issued by NCIB
Identification bearing applicant's photo.

HOW TO REGISTER

Please note that the applicant must appear in person for the interview and registration process.

In preparation for your Citizenship enrollment, if you are Ugandan by descent you will need to know a number facts about your own birth,origin in Uganda, residence, ethnicity and similar details concerning your parents,.

All applicants are advised to prepare the following information that is required to fill the Enrollment Form, (with all necessary supporting documents If readily available);

Full name of the applicant
Residential address
Date of birth
Place of birth
Indigenous community/tribe to which the applicant belongs
Place of origin
Occupation/profession
Spouse's name
Parents name, nationality, tribe and clan
Documents such as Marriage Certificates and/or Baptism Cards are not compulsory at Registration but may be used in the absence of other primary documents.
IF YOUR CITIZENSHIP IS IN DOUBT

In the event that your citizenship status is in doubt, you will be required at a later time, to prove beyond reasonable doubt that you are indeed a citizen of Uganda, by appearing before a citizenship verification committee. Citizenship verification Committees have been established at the Sub County and District level. There is also a National Appeals Committee Constituted by the NIRA, mandated to carry out the National ID Exercise.

COST OF A NATIONAL IDENTITY CARD

The process is absolutely free.The Registration form and the Extra Spouse forms are free-NOT FOR SALE but cannot be downloaded online. The National Identity Card shall be issued free of charge for the first time but a fee shall be levied upon replacement.

At renewal; 10 years after Card Issuance, change of particulars, loss or damage of the National Identity Card,you may be required to pay a fee.

WHAT DO I HAVE TO SHOW THAT I HAVE BEEN REGISTERED BEFORE I RECEIVE THE NATIONAL IDENTITY CARD?

After enrollment, you will retain two copies of the Enrollment form. You will present a copy of the Enrollment Form at the Enrollment Center at the time you are contacted by the Embassy to pick up your card. Please note that your card MUST be picked up in person.

CHANGE OF PARTICULARS

This service is available to persons who have made changes in their civil status. These changes include; change of name after marriage,change of location, change of name and others. Please allow a period of Information update.  Applicants will be required to come with a document or a combination of any of the following documents depending on the type of change:-

Marriage certificate
Deed poll
School leaving certificates
Statutory Declarations
Divorce certificates
Payment receipt
Any other as the case maybe.

THE IMPLICATIONS OF BEING A REGISTERED AS CITIZEN OF UGANDA


Upon registration as a citizen of Uganda, you become a legally recognized citizen of Uganda and certain duties, responsibilities and rights accrue;

You will be able to assert yourself as a citizen of Uganda;
Perform the duties as required of a citizen;
You will easily access Government services such as health care, free education such as U.P.E. U.S.E, government sponsorship at tertiary institution level, employment within the public civil service and private sector.
You will exercise your right to vote in the parliamentary and presidential elections with more authority.
Right to a Ugandan passport will be easy to demonstrate.

MAJOR BENEFITS OF THE NATIONAL IDENTITY CARD

The National Identity Card will;

a) Facilitate the delivery of national development based on reliable &verifiable data:

Enable Government plan properly and provide easy access to good social facilities & services
benefiting from the National Health System and school capitation grants based on verifiable identities and data at the local level
Facilitate more transparent and trust worthy business transactions
Help keep crime low in our communities with quick and reliable identification of criminals
Guarantee the unique association "one-document/one-identity" in the delivery of services, e.g., driver licensing, passports,voting process, business transactions, etc.
Help secure properties, title deeds & assets

b) Facilitate Regional and International integration based on verifiable and reliable data:

Support for regional integration (protocols for movement across the region)
Conform to International obligations as a base document for issuance of the new East African Community E-Passport
The processes are designed to eliminate false identity attempts by individuals,whether at the bank, university admissions etc.

Key services targeted to be integrated following the implementation of the National ID:

Public Safety & Security Services
Passport Processing & Issuance
Immigration Services - legal residence & border crossing/ checks
Uganda Revenue Authority - effective taxation targeting
NSSF- social security benefits delivery
National Health Service & Hospitals Delivery - NHIS & patient management
Electoral Process Enhancement - voter list generation & voter verification(Smart elections) - the National Identity Card is also a pre-requisite for National Elections as a voting requirement
Financial Institutions/Banks - secure and undoubted verification system in order to access financial services
Births & Deaths Registration - improved child security
Driver & Vehicle Licensing - validation & de-duplication
Hospitality & Tourism Services
Schools & Universities Examinations / Admissions System
Public Service - employee verification
Employment Generation - youth employment schemes
No Ugandan citizen can access a school for his/her child without proof of Identification using the National Identity Card
 
''', "document":"assets/iamges/ids.pdf"},
      
      {"title": "Official Documents", "description": '''
Authentication of Documents
The Embassy authenticates official documents issued by recognized institutions in Uganda for use in the United States. These include:

Birth Certificates
Passports
Academic certificates and transcripts
Marriage certificates

Holders of the documents must present the following:

Original document bearing the stamp and signature of issuing institution
Photocopies of the document (depending on the number of copies required)
Authentication fee of 50 dollars per set of documents. A set consists of one copy of each of the documents.

Note: The Embassy will take time to verify the authenticity of the document with the issuing institution before endorsing it. This may cause delays in processing the documents. Bearers of forged documents will be handed over to the authorities.

 

Requirements for Obtaining a Letter of No Objection to J1 Visa Waiver

Copy of the main page of your Ugandan passport.
A letter to the Embassy signed by the applicant.
Copy of a letter of no objection from the course sponsor.
Copy of the Certificate of Eligibility (DS-2019)
Copy of the submitted J1 Visa waiver recommendation Application (DS-3035)
Copy of the confirmation print out for the submitted waiver application.
 
Requirements for a Letter of Recommendation for NGOs

A Certificate of Authenticity obtained from the US Department of State. (Check www.state.gov/m/a/auth for details on how to obtain the certificate)
Articles of Incorporation
Certificate of Incorporation
A money order of US 50 dollars payable to Uganda Embassy
A prepaid self addressed return envelope
2 copies of the documents to be authenticated
 
Certification of Documents for Transportation of Remains of Deceased Persons to Uganda
Certification is done free of charge. Processing time is 1 working day.

The following original documents are required for certification:

BURIALS

A Signed letter of request for certification from a responsible person e.g. A relative, an employer etc.
The Passport of the deceased. 
A Death certificate.
A Certificate of Embalmment.
A Burial permit from the local authority where the deceased person resided.
A certificate of no contagious diseases.
Post mortem report or Comprehensive Medical Report from the attending doctor/health facility
The transporting airline will advise the applicant on an appropriate casket.
 

CREMATIONS

A Signed letter of request for certification from a responsible person e.g. A relative, an authorized person known to the deceased etc.
The Passport of the deceased. 
A Death certificate.
A Certificate of cremation.
All documents above are to be sent to Embassy by express mail for authentication with a prepaid return envelope.
 
Regulations Governing Importation of Dogs and Cats into Uganda
Movement Permit

An official and authentic "Movement Permit" should be obtained from the veterinary authority of the area of origin.

Certificates

A bill of health certifying that the pet is free from disease. It should be issued by a registered veterinary surgeon or official and should be properly signed and stamped within ten days of shipment.

A certificate or letter from the local veterinary authorities indicating that the area of origin of the pet is free from rabies.

Vaccinations

Dogs require vaccination against distemper, hepatitis, Leptospirosos, Parvo-virus and rabies. It should have been done not less than 30 days prior to arrival at any point of entry into Uganda.

Cats require vaccinations against Feline Entritis and rabies. It should have been done not less than 30 days prior to arrival at any point of entry into Uganda.

Transportation

While in transit, Dogs and Cats must not come into contact with other animals. To ensure this, each pet should be appropriately crated.
'''},
     
      {"title": "Passports", "description": '''
PASSPORTS

(Note: Please bring printed copies of the requirements listed when you come in for enrollments at the Embassy)

 

W.E.F April 1st, 2022, the Passport Processing System at the Uganda Embassy in Washington DC, will change from manual submission of applications through mail to in-person appearance at the Embassy.

 

The Consular Section of the Embassy will be open and offer in-person enrollment and interviews for passport applicants after they have completed the passport application online, paid for passport and courier fees, and application form dully submitted. Applicants must then make an appointment on the e-passport portal before visiting the Embassy for enrollment.

 

www.passports.go.ug

 

The Uganda Embassy WILL NO LONGER RECEIVE couriered Passports for renewal. All Directorate of Citizenship and Immigration Control (DCIC) e-passport services are paid for online or over-the-counter in any Ugandan bank that collects Non-Tax Revenue for the Uganda Revenue Authority (URA).

 

In light of these changes, the Embassy wishes to inform the general public of changes in our service provision as follows:

1. Please DO NOT pay for multiple passports under the same name even if the passports belong to a family or a group. The name of each applicant should appear on the Uganda Revenue Authority (URA) receipt AS IT APPEARS ON THE APPLICATION FORM. Please process payment for each individual's passport as per the auto-generated PRN numbers on your application form within 21 days of creating your application. This includes renewal applications for minors. Failure to pay within the given 21 days will make the PNR receipt null and void. Applicants must make a fresh application online and dully pay for it.
 

2. Applicants MUST ensure that the courier fees are included along with the passport application fees.
 

3. Please note that due to reduced operations, possible disruptions and logistical challenges in expedited passport service, the turn-around time for passport renewal is approximately 14 working days. Passports are printed in the Kampala Passport processing Center and not at the Embassy, therefore applicants are strongly advised to make their online applications and make appointments well in advance to avoid disappointments. 
 

4. Applicants are advised that selecting Expedited processing applies only to the speed at which the passport is printed in Kampala. Due to the logistical challenges of international shipping, the embassy can not guarantee a faster shipping time.  
 

5. Applicants for Emergency Travel Documents, please refer to the Embassy website in the Consular Services section for guidelines. 
 

REQUIREMENTS FOR PASSPORT RENEWAL

 

1. Proceed to the online Passport Application portal and ensure that you include your current phone number where you will receive updates by SMS or email.
2. Once the application and payments are complete, print the copy showing a nine-digit Application ID number (e.g. W000123456) Please ensure that you pay all the assessment fees including the UGX 10,000 courier fees.
3. Print your receipts after making your online payment. 
4. Book your appointment date online (Passport Portal www.passports.go.ug) for enrollment at the Embassy
5. Appear at the Embassy with printed appointment form on the scheduled date
With the following;

•  Most Recent Passport 
• Photo Copy of Ugandan national I.D (If you have one)
• Photo Copy of the recommender's Ugandan National I.D.
• Print-out of  payment receipts
• Form of ID: Residential I.D/Student I.D/Driving license I.D or Old US Visa
• A pre-paid self-addressed courier return envelope in a packet (EXPRESS or PRIORITY mail with a tracking number for shipment of your new passport when it arrives in Washington, DC )
(Note: Passport photos not required. Your photo will be taken at the renewal process)

6. For Minors below 18 years come with the following:

• Old Passport of the Child

• Letter of Consent from one of the parents
• Birth Certificate of the child
• Photo copy of parent's Passport or National ID
 

7.  Avail the Embassy with a reliable call-back number in the USA on your application.


8. Applicants may be requested for additional supporting documentation where necessary.

 

9. For lost/damage/stolen passport pay the assessed "fine for lost passport" fee of UGX 100,000 in addition to the regular passport fees. You must select either lost, stolen or damaged for the type of passport required.

 

10. Please do not come with Passport size pictures.

Note: Requests for refund of passport fees must be in writing and addressed to the URA Commissioner General via email to customersupport@ura.go.ug. The Embassy is not in position to refund passport fees.

 

The Embassy will be closed to the public on Ugandan and USA Public Holidays)

The Embassy of the Republic of Uganda is located at the address below:

5911 16th Street NW, Washington, DC 20011

Phone: +1-(202) 726-7100
Fax:          (202) 726-1727
Email: washington@mofa.go.ug OR info@ugandaembassyus.org

Passport Enrollment Hours:

Monday - Friday - 10:00am to 2:00pm (EST)

 

Passport Renewal FAQ's

When can I visit the Embassy for enrollment?

Monday to Friday between 9:00 am - 2.00 pm, with a printed copy of your appointment date and time.  Ensure you have booked an appointment on the passport portal at  https://www.passports.go.ug.

Am I really required to appear in person to submit my passport application?

Yes. Once you have submitted your application online and have booked your appointment, please print your confirmation page and a copy of your application and report to the Embassy with your documents at the appointed date and time.

Am I required to have a National ID to apply for the E-passport?

No. All applicants in the diaspora are not mandated to present a national ID, but it eases the requirement of proof of citizenship. If you are a dual Citizen, you will need to present a Uganda certificate of Dual Citizenship at the Embassy.

I am a Dual Citizen and want to renew my Ugandan Passport. How do I do this?

Please note that in order to hold passports of two nationalities the law in Uganda requires you to formally register as a dual citizen first. In order to renew your Ugandan Passport you will need to present your Certificate of Dual Citizenship.

Who can be a recommender?

A person with a Ugandan Passport or National ID who can attest to your identity.   Ensure that the recommender signs the section which indicates “recommender’s signature”, or a signed copy of passport or national ID can be presented.

 

How will I know when my passport is ready for collection?

An automated SMS message or email will be sent to you once the Embassy receives your passport in Washington, DC. Please ensure that the US phone number or email you provide during enrollment is active. There is no need to call the Embassy.

 

How will I receive my passport once the Embassy receives it from Kampala?

All applicants must present a pre-paid self-addressed courier return envelope in a packet (EXPRESS or PRIORITY mail with a tracking number for shipment of your new passport. The sender section of the envelope should indicate “Uganda Embassy 5909 16th St. NW, Washington DC 20011” and the recipient section of the envelope should indicate your preferred receiving address.

 

I am having trouble making an online payment, can you advise how to resolve this?

• Applicants can try to use a different browser.
• Close the application and log in again or try to pay later.  Alert your local Bank first that your Bank card is being used for an overseas transaction. 
• Ensure that you pay using either  VISA or Mastercard. 
• The Banks in the drop-down menu are the payee banks in Uganda. You do not need to have an account with any of them in order to select one to pay into.
• You can also pay directly through the Uganda Revenue Authority (URA) portal at www.ura.go.ug
1. At the URA homepage, select E-Services, on the left-hand side of the page
2. Click on payments
3. Select Mastercard or VISA card payment icon, and follow the prompts.
4. Make each payment separately. Each will have its unique PRN.
5. Print the receipt after each payment


Over-the-counter Bank Payments

 

• You have the option to ask a trusted person to make payment on your behalf at most Banks in Uganda that accept URA payment. Payments must be made using the PRN numbers auto-generated on your passport application form.

Qn: I completed my application but the system will not let me book my appointment.

Ans: Please check that all the assessed payments as outlined on your application form have been paid. This includes the UGX 10,000 courier fees. Please note that each fee must be paid as a separate transaction. Incomplete payments will prevent you from progressing to the Appointments portal. 

Note that fees should not be paid as a lump sum, each fee has a unique PRN serial number tagged to it which must be credited separately.
 

Qn: I need to reschedule my appointment.

Ans: An appointment date, once selected, cannot be rescheduled until the allocated date has passed.  You will only be able to reschedule your appointment 24 hours after the original date you were allocated has passed.

 
''',"document":"assets/iamges/pass.pdf"},
     
      {"title": "Visas", "description": '''
Uganda Electronic Visa/Permit Application System
 


The Government of Uganda introduced an online visa/permit application system with effect from 1st July 2016. The Uganda Electronic Visa/Permit Application System performs checks against law enforcement databases. All travellers seeking admission to Uganda are required to obtain a visa using this system prior to being granted boarding. All persons intending to travel to Uganda for holiday, tourism,business, study, visit, and/or medical are required to apply and obtain a visa online. Applications should be filled at the following link: https://visas.immigration.go.ug.

Any person intending to enter into Uganda should do so only for lawful purposes and in accordance with national immigration laws, guidelines and formalities.

Foreign nationals intending to enter Uganda for purposes of employment should comply with requirements for expatriate employment in Uganda.

Visa Exemptions

Nationalities that do not require a Visa to enter Uganda:

*    COMESA: Angola, Eritrea, Malawi,Madagascar, Seychelles, Swaziland, Zambia, Comoros, Kenya, Mauritius, Zimbabwe

*   EAC: Tanzania, Rwanda, Kenya,Burundi, South Sudan

*  OTHERS: Antigua, Barbados, Fiji,Grenada, Lesotho, Sierra Leone, Solomon Islands, Vanuatu, Cyprus, Bahamas,Belize, Gambia, Jamaica, Malta, Singapore, St. Vincent and the Grenadines.

Any other exemption as may be specified on arrival.

Application Process:

How to Apply for a Visa

All persons intending to travel to Uganda for holiday, tourism, business, study, visit, and/or medical are required to apply and obtain a visa online. Applications should be filled at the following link: https://visas.immigration.go.ug.


 

Uganda evisa application portal

Step-1: Choose the application type(Visa or Permit), category (Ordinary, Multiple-Entry, Diplomatic and Official,Transit, East Africa Tourist Visa), subcategory (single-entry, multiple-entry for 6-12 months, 12-24 months or 24-36 months)

Step-2: Fill the electronic form

Step-3: Add documents (Copy of recent passport size photograph, Copy of passport bio-data page, Yellow Fever Vaccination Certificate, Recommendation letter, Police clearance, etc.)

Step-4: Submit

Once the application is submitted it will be studied by an Immigration Officer. Please note that during the approval process additional information may be required. The new required information can be submitted electronically through https://visas.immigration.go.ug/#/check.

 

TRAVEL AUTHORIZATION

Upon submission, the applicant will receive a notification with an application number which he/she can use to track the application. The decision taken on the application will be sent electronically through the email provided by the applicant. If approved, an approval letter will be sent as an attachment to the email provided. This letter serves as a Travel authorization. Print it out and present it together with a valid passport /travel document of not less than 6 months' validity at the port of entry.


This travel authorization does not guarantee entry into Uganda. Travellers will be subjected to secondary verification where necessary before a visa can be placed in the passport.

Information about documents required in the online visa application can be found here: https://visas.immigration.go.ug/#/help/visa.

 

APPLICATION TIMELINE

All visas, permits and passes are approved within two (2) to three (3) working days, except in special circumstances where more documents and/or verification may be required.However, applicants are advised to apply at least five (5) working days before their intended date of travel.

Applicants are advised to only submit their application in a period that falls within 3 months of their departure from Uganda. The validity of an approved E-Visa is three months starting from the issue date.

SERVICES AVAILABLE ON THE E-VISA PORTAL:

All Types of visas
Entry Permits / Work Permits
Students Pass
Special Pass
Dependant's Pass (If the principal's work Permit was obtained electronically)
Certificate of Residence
Dual Citizenship Certificate (NEW)
 

TYPES OF VISAS

1) Visas to Uganda

The Embassy issues single entry visas for a maximum duration of 3 months and multiple entry visas for a maximum duration of 6 months. Any extensions of this period, can be applied for at the Immigration Office in Kampala.

2) EAC Visas

The East Africa Tourist Visa allows travel between Kenya, Rwanda and Uganda with the same multiple entry visa. This visa is the result of a joint initiative made by the Heads of States of the respective partner countries to boost regional travel and create opportunities for tourists to explore the diversity of East Africa. Travelers from any country can obtain a multiple entry visa that will allow entry to the Republic of Kenya, the Republic of Rwanda, and the Republic of Uganda for tourism over period of 90 days. Please note that this visa does NOT grant entry into the United Republic of Tanzania, Burundi or South Sudan.

 

INFORMATION AND ELIGIBILITY

Eligible Person: Tourist, no restrictions on country of origin

Dependents: All persons must apply in their own right.

Travel Documents: All tourists must have an official and genuine international passport, valid for not less than 6 months from the time of visa application.

Visa Fees: 100 USD per visa

Validity of Visa: 90 days

Single of Multiple Entry: Multiple entry to all three countries

Work or no Work: Work is not permitted on a vistor /tourist visa

Visa Extension: An East Africa Tourist Visa cannot be extended.

Country of Entry: The holder of the East Africa Tourist Visa must enter the region from the country that issued the visa and move within the two other countries without applying for another visa or paying another visa fee.

Movement of persons: The holder shall also be allowed to move out of the Republic of Kenya, the Republic of Rwanda, and the Republic of Uganda and return without having to pay for another visa. This will only be applicable for the validity period of the visa (90 days from visa approval).

3) Payment for Visas

All applications and payment must be made online through the following link: https://visas.immigration.go.ug.

PLEASE NOTE THAT THERE WILL BE NO REFUNDS MADE FOR PAYMENTS MADE INTO THE EMBASSY BANK ACCOUNT.

4) Issuance of visas at Uganda Missions Abroad (Embassies):

E-visas and e-permits are centrally approved but can be personalized at Point of Entry or Missions Abroad that have been equipped with the e-immigration system. The Uganda Embassy Washington, DC provides this personalization visa service for travellers that prefer not to receive their visas upon arrival in Uganda. This service is offered between the hours of 10:00 - 15:00 hrs.

5) REQUIREMENTS FOR OBTAINING A UGANDA VISA WHEN TRAVELING ON GOVERNMENT BUSINESS

The Uganda embassy shall still retain the responsibility of processing all diplomatic and official visa applications.

Government officials traveling on official business must submit visa applications with the following supporting documents:

For US Government officials;

A Note Verbale from the US Department of State clearly indicating the details of the traveling official, purpose of travel, host institution and period of stay in Uganda.

For non-US citizens traveling on official Government business to Uganda;

A Note Verbale from their respective Ministry of Foreign Affairs or Diplomatic Mission accredited to the United States, clearly stating the details of the traveling official, purpose of travel, host institution and period of stay in Uganda.

There is no processing fee for this category of visa.

Applications without the above supporting documents will not be processed

Applicants are requested to forward documents with cover Notes Verbales to the Uganda Embassy between the hours of 09:00 to 14:00 hrs, Monday-Friday

CONTACTS

The Consular Section at the Uganda Embassy is open to applicants for the collection of their visa stickers having received approval from the above website or inquiries, Monday to Thursday from 10:00 a.m. to 3:00 pm only (except on Public Holidays in Uganda and the United States).

Applicants must apply for a visa using the E-Visa portal.

Issues regarding visas can be referred to the following email: Kkasibayo@ugandaembassyus.org please leave your name and a reliable call back number.

Before you proceed, please click here for online EVisa scam alert notice:


All visa applications must be submitted online via ONLY the official Uganda E-Visa website: https://visas.immigration.go.ug/.  Treat any other website advertising online visa services as an attempt to defraud you. The Embassy shall not be responsible for applications processed through any other website The Government of Uganda will NOT be responsible for any loss of funds or extra expenditure incurred as a result of using the unofficial site. Paper applications will not be processed and may result in delays.

Visitors traveling to Uganda are warned about the following fake websites https://www.evisaforuganda.com/index , http://www.uganda-evisa.com/, www.traveltouganda.org, www.evisaforuganda.com,  https://www.ugandaimmigration.org, https://www.traveldocs.com/travel-services/uganda-e-visa and many others which not only fraudulently claim to be application portalsfor e-visas to Uganda, but also charge incorrect amounts in addition to hefty "processing fees" ranging from \$110 to \$200.

The correct fee is \$50 US Dollars.

How to spot a fraudulent E-visa website:

1.     The web site only has the following visa options:

Tourist Visas
Transit Visas
Multiple Entry Visas

Unlike the official website, https://www.visas.immigration.go.ug, which  provides for the following options:

Visa For Diplomatic and Official Passport Holders
Uganda Ordinary/Tourist Visa
East Africa Tourist Visa
Transit Visa
Multiple-Entry Visas
Entry (Work Permits)
Dependant Passes
Student Passes
Special Passes and Certificates of Residence
Dual Citizenship

2.     Please note that the official website bears the Ugandan Coat of Arms and DCIC Logo.

The fake website has three steps which are basically as follows:

Apply online
Make an online payment and
Check your email for feedback.

There are four steps on the official application website which are;

Selecting the application type
Fill the form
Add documents
Submit
Make online payments (only visas)

'''}
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          shadowColor: Colors.black.withOpacity(0.4),
          child: ListTile(
            title: Text(service["title"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            subtitle: Text(service["description"]!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Colors.black54)),
            trailing: service.containsKey("document")
                ? const Icon(Icons.file_download, color: Color(0xFFFF5C23))
                : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => ServiceDetailsPage(
            title: service["title"]!, 
        description: service["description"]!,
        document: service["document"],
                ),
                ),
              );
            },
          ),
        );
      },
    );
  }

Widget _buildServiceCard({
    required String imagePath,
    required String title,
    required String description,
    required VoidCallback onReadMore,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      shadowColor: Colors.black.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: onReadMore,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(8.0),
                      backgroundColor: const Color(0xFFFF5C23),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Read More',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}




 