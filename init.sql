-- FCC ULS Database Initialization Script
-- Generated for node-uls project bootstrap-db feature
-- This script creates all 83 tables defined in the ULS database schema

-- Use the ULS database
USE uls;

-- Set character set and collation
SET NAMES utf8mb4;
SET character_set_client = utf8mb4;

-- HD (Application / License Header)
CREATE TABLE IF NOT EXISTS HD (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LicenseStatus CHAR(1),
    RadioServiceCode CHAR(2),
    GrantDate DATE,
    ExpiredDate DATE,
    CancellationDate DATE,
    EligibilityRuleNum CHAR(10),
    Reserved1 CHAR(1),
    Alien CHAR(1),
    AlienGovernment CHAR(1),
    AlienCorporation CHAR(1),
    AlienOfficer CHAR(1),
    AlienControl CHAR(1),
    Revoked CHAR(1),
    Convicted CHAR(1),
    Adjudged CHAR(1),
    Reserved2 CHAR(1),
    CommonCarrier CHAR(1),
    NonCommonCarrier CHAR(1),
    PrivateComm CHAR(1),
    Fixed CHAR(1),
    Mobile CHAR(1),
    Radiolocation CHAR(1),
    Satellite CHAR(1),
    Developmental CHAR(1),
    InterconnectedService CHAR(1),
    CertifierFirstName VARCHAR(20),
    CertifierMI CHAR(1),
    CertifierLastName VARCHAR(20),
    CertifierSuffix CHAR(3),
    CertifierTitle CHAR(40),
    Female CHAR(1),
    BlackOrAfricanAmerican CHAR(1),
    NativeAmerican CHAR(1),
    Hawaiian CHAR(1),
    Asian CHAR(1),
    White CHAR(1),
    Hispanic CHAR(1),
    EffectiveDate DATE,
    LastActionDate DATE,
    AuctionID INTEGER,
    BroadcastServicesRegulatoryStatus CHAR(1),
    BandManagerRegulatoryStatus CHAR(1),
    BroadcastServicesTypeOfRadioService CHAR(1),
    AlienRuling CHAR(1),
    LicenseeNameChange CHAR(1),
    WhitespaceIndicator CHAR(1),
    OperationRequirementChoice CHAR(1),
    OperationRequirementAnswer CHAR(1),
    DiscontinuationOfService CHAR(1),
    RegulatoryCompliance CHAR(1),
    NineHundredMHzEligibilityCert CHAR(1),
    NineHundredMHzTransitionPlanCert CHAR(1),
    NineHundredMHzReturnSpectrumCert CHAR(1),
    NineHundredMHzPaymentCert CHAR(1)
);

-- AD (Application Detail)
CREATE TABLE IF NOT EXISTS AD (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    ApplicationPurpose CHAR(2),
    ApplicationStatus CHAR(1),
    ApplicationFeeExempt CHAR(1),
    RegulatoryFeeExempt CHAR(1),
    Source CHAR(1),
    RequestedExpirationDate CHAR(4),
    ReceiptDate DATE,
    NotificationCode CHAR(1),
    NotificationDate DATE,
    ExpandingAreaOrContour CHAR(1),
    MajorMinorIndicator CHAR(1),
    OriginalApplicationPurpose CHAR(2),
    RequestingAWaiver CHAR(1),
    HowManyWaiversRequested INTEGER,
    AnyAttachments CHAR(1),
    NumberOfRequestedSIDs INTEGER,
    FeeControlNumber CHAR(16),
    DateEntered DATE,
    NoLongerUsed VARCHAR(255),
    FrequencyCoordinationIndicator CHAR(1),
    EmergencySTA CHAR(1),
    OverallChangeType CHAR(1),
    ExtendedImplementationPlan CHAR(1),
    Grandfathered CHAR(1),
    WaiverDeferralOfApplicationFees CHAR(1),
    HasTermPendingInd CHAR(1),
    UseOfService CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- EN (Entity)
CREATE TABLE IF NOT EXISTS EN (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    EntityType CHAR(2),
    LicenseeID CHAR(9),
    EntityName VARCHAR(200),
    FirstName VARCHAR(20),
    MI CHAR(1),
    LastName VARCHAR(20),
    Suffix CHAR(3),
    Phone CHAR(10),
    Fax CHAR(10),
    Email VARCHAR(50),
    StreetAddress VARCHAR(60),
    City VARCHAR(20),
    State CHAR(2),
    ZipCode CHAR(9),
    POBox VARCHAR(20),
    AttentionLine VARCHAR(35),
    SGIN CHAR(3),
    FRN CHAR(10),
    ApplicantTypeCode CHAR(1),
    ApplicantTypeCodeOther CHAR(40),
    StatusCode CHAR(1),
    StatusDate DATE,
    ThreePtSevenGHzLicenseType CHAR(1),
    LinkedUniqueSystemIdentifier DECIMAL(9,0),
    LinkedCallSign CHAR(10),
    PRIMARY KEY (UniqueSystemIdentifier, EntityType),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- A2 (Additional Application Detail)
CREATE TABLE IF NOT EXISTS A2 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    SpectrumManagerLeasing CHAR(1),
    DefactoTransferLeasing CHAR(1),
    NewSpectrumLeasing CHAR(1),
    SpectrumSubleasing CHAR(1),
    TransferOfControlOfLessee CHAR(1),
    RevisionOfSpectrumLease CHAR(1),
    AssignmentOfSpectrumLease CHAR(1),
    PFRStatus CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- RE (Reason)
CREATE TABLE IF NOT EXISTS RE (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    Reason VARCHAR(255),
    PRIMARY KEY (UniqueSystemIdentifier, Reason(255)),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MW (Microwave)
CREATE TABLE IF NOT EXISTS MW (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    PackIndicator CHAR(1),
    PackRegistrationNumber INTEGER,
    PackName VARCHAR(50),
    TypeOfOperation CHAR(45),
    SMSACode CHAR(6),
    StationClass CHAR(4),
    CummulativeEffectIsMajor CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CG (Coast and Ground)
CREATE TABLE IF NOT EXISTS CG (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    StationAvailable CHAR(1),
    PublicCorrespondence CHAR(1),
    StationIdentifier CHAR(12),
    AeronauticalEnrouteCallSign CHAR(10),
    FAAOfficeNotified VARCHAR(255),
    DateFAANotified DATE,
    SeekingAuthorization CHAR(1),
    RegularlyEngaged CHAR(1),
    Engaged CHAR(1),
    PublicMooring CHAR(1),
    Servicing CHAR(1),
    FixedStation CHAR(1),
    MaritimeSupport CHAR(1),
    AeronauticalFixed CHAR(1),
    Unicom CHAR(1),
    SearchAndRescue CHAR(1),
    FlightTestUHF CHAR(1),
    FlightTestManufacturer CHAR(1),
    FlightTestParentCorporation CHAR(1),
    FlightTestEducational CHAR(1),
    FlightSchoolCertitication CHAR(1),
    LighterThanAir CHAR(1),
    Ballooning CHAR(1),
    LocatedAtAirport CHAR(1),
    RadiodeterminationNotFAA CHAR(1),
    RadiodeterminationEquipment CHAR(1),
    RadiodeterminationPublic CHAR(1),
    RadiodeterminationELTs CHAR(1),
    CivilAirPatrol CHAR(1),
    AeronauticalEnroute CHAR(1),
    MobileRoutine CHAR(1),
    MobileOwnerOperator CHAR(1),
    MobileAgreement CHAR(1),
    CoastGroundIdentifier CHAR(12),
    SelectiveCallSignIdentifier CHAR(4),
    ClassStationCode CHAR(4),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FA (FRC Admin)
CREATE TABLE IF NOT EXISTS FA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    OperatorClassCode CHAR(2),
    ShipRadarEndorsement CHAR(1),
    SixMonthEndorsement CHAR(1),
    DateOfBirth DATE,
    CertificationNotRestricted CHAR(1),
    CertificationRestrictedPermit CHAR(1),
    CertificationRestrictedPermitLimitedUse CHAR(1),
    ColeManagerCode CHAR(5),
    DMCallSign CHAR(10),
    ValidProofOfPassing CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SH (Ship)
CREATE TABLE IF NOT EXISTS SH (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    TypeOfAuthorization CHAR(1),
    NumberInFleet INT,
    GeneralClassOfShipCode CHAR(3),
    SpecialClassOfShipCode CHAR(3),
    ShipName VARCHAR(35),
    OfficialNumberOfShip CHAR(12),
    InternationalVoyagesIndicator CHAR(1),
    ForeignCommunicationsIndicator CHAR(1),
    RadiotelegraphWorkingSeriesRequested CHAR(1),
    RequestForMMSI CHAR(1),
    GrossTonnage INT,
    ShipLength INT,
    WorkingFreqS1 CHAR(3),
    WorkingFreqS2 CHAR(3),
    SelCallNumber CHAR(5),
    SelCallINMARSAT CHAR(7),
    MMSINumber DECIMAL(9,0),
    RequiredCatA CHAR(1),
    RequiredCatB CHAR(1),
    RequiredCatC CHAR(1),
    RequiredCatD CHAR(1),
    RequiredCatE CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SR (Ship Rescue Administration)
CREATE TABLE IF NOT EXISTS SR (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    EPIRB_Identification_Code CHAR(1),
    INMARSAT_A CHAR(1),
    INMARSAT_B CHAR(1),
    INMARSAT_C CHAR(1),
    INMARSAT_M CHAR(1),
    INMARSAT_Mini CHAR(1),
    VHF CHAR(1),
    MF CHAR(1),
    HF CHAR(1),
    DSC CHAR(1),
    EPIRB_406_MHZ CHAR(1),
    EPIRB_121_5_MHZ CHAR(1),
    SART CHAR(1),
    Raft_Count DECIMAL(6,0),
    Lifeboat_Count DECIMAL(6,0),
    Vessel_Capacity DECIMAL(6,0),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SE (Ship Exemption)
CREATE TABLE IF NOT EXISTS SE (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ShipCallSign CHAR(10),
    PortRegistry VARCHAR(35),
    Owner CHAR(1),
    Operater CHAR(1),
    Charter CHAR(1),
    Agent CHAR(1),
    RadiotelePhoneExemptionRequested CHAR(1),
    GMDSSExemptionRequested CHAR(1),
    RadioDirectionExemptionRequested CHAR(1),
    PreviousExemptionFileNumber VARCHAR(10),
    ForeignPort CHAR(1),
    VesselSizeException CHAR(1),
    EuipmentExemption CHAR(1),
    LimitedRoutesExemption CHAR(1),
    ConditionOfVoyagesExemption CHAR(1),
    OtherExemption CHAR(1),
    OtherExemptionDescription VARCHAR(50),
    ShipType CHAR(1),
    NumberOfCrew INTEGER,
    NumberOfPassengers INTEGER,
    NumberOfOthers INTEGER,
    CountOfVHF INTEGER,
    CountOfVHFDSC CHAR(1),
    CountOfEPIRB INTEGER,
    CountOfSurvivalCraft INTEGER,
    CountOfEarthStation INTEGER,
    CountOfAutoAlarm INTEGER,
    CountOfSingleSideBand INTEGER,
    SingleSideBandTypeMF CHAR(1),
    SingleSideBandTypeHF CHAR(1),
    SingleSideBandTypeDSC CHAR(1),
    CountOfNAVTEX INTEGER,
    CountOf9GHzRadar INTEGER,
    CountOf500KHzDistress INTEGER,
    CountOfReservePower INTEGER,
    CountOfOther INTEGER,
    DescriptionOfOther VARCHAR(50),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SV (Ship Voyage)
CREATE TABLE IF NOT EXISTS SV (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    VoyageNumber INTEGER,
    VoyageDescription VARCHAR(255),
    PRIMARY KEY (UniqueSystemIdentifier, VoyageNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LM (Land Mobile Administration)
CREATE TABLE IF NOT EXISTS LM (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ExtendedImplementationApproved CHAR(1),
    EligibilityActivity VARCHAR(255),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MI (MDS / ITFS Administration)
CREATE TABLE IF NOT EXISTS MI (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FacilityTypeCode CHAR(4),
    StatementOfIntention CHAR(1),
    LicenseTypeCode CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- BC (Broadcast Call Sign)
CREATE TABLE IF NOT EXISTS BC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    BroadcastCallSign CHAR(10),
    BroadcastCity CHAR(20),
    BroadcastState CHAR(2),
    FacilityIDOfParentStation INTEGER,
    RadioServiceCodeOfParentStation CHAR(2),
    NonParentTypeCode CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FC (Frequency Coordination)
CREATE TABLE IF NOT EXISTS FC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CoordinationNumber CHAR(25),
    CoordinatorName CHAR(40),
    CoordinatorPhone CHAR(10),
    CoordinationDate DATE,
    ActionPerformed CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, CoordinationNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- HS (History)
CREATE TABLE IF NOT EXISTS HS (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LogDate DATE,
    Code CHAR(6),
    PRIMARY KEY (UniqueSystemIdentifier, LogDate, Code),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CO (Comments)
CREATE TABLE IF NOT EXISTS CO (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    CommentDate DATE,
    Description VARCHAR(255),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, CommentDate, Description(255)),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- TA (Transfer / Assign)
CREATE TABLE IF NOT EXISTS TA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    FileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    ProForma CHAR(1),
    FullAssignment CHAR(1),
    MethodOfAccomplishment CHAR(1),
    MethodOtherDescription VARCHAR(30),
    VoluntaryInvoluntary CHAR(1),
    AssignorTransferorCertifierFirstName VARCHAR(20),
    AssignorTransferorCertifierMI CHAR(1),
    AssignorTransferorCertifierLastName VARCHAR(20),
    AssignorTransferorCertifierSuffix CHAR(3),
    AssignorTransferorCertifierTitle CHAR(40),
    GrossRevenueYear1 DECIMAL(15,2),
    GrossRevenueYear2 DECIMAL(15,2),
    GrossRevenueYear3 DECIMAL(15,2),
    TotalAssets DECIMAL(15,2),
    SameSmallCategory CHAR(1),
    ApplyingForInstallments CHAR(1),
    NotificationOfForebearance CHAR(1),
    WirelessLicensesNeedApproval CHAR(1),
    NonWirelessLicensesNeedApproval CHAR(1),
    AssignorTransferorMaleOrFemale CHAR(1),
    AssignorTransferorAfricanAmerican CHAR(1),
    AssignorTransferorNativeAmerican CHAR(1),
    AssignorTransferorHawaiian CHAR(1),
    AssignorTransferorAsian CHAR(1),
    AssignorTransferorWhite CHAR(1),
    AssignorTransferorEthnicity CHAR(1),
    ConsentDate DATE,
    ConsummationDate DATE,
    ConsummationDeadline DATE,
    EligibilityCategory VARCHAR(30),
    LeadFileNumber CHAR(14),
    HasAssignmentOrTransferAlreadyOccurred CHAR(1),
    DateTransactionOccurred DATE,
    DateForbearanceTransactionWasConsummated DATE,
    IsAssignmentPartialAssignmentOfSiteBasedLicenses CHAR(1),
    WouldApplicationCreateAGeographicOverlap CHAR(1),
    DoesHoldInterestsInAnyEntityHavingAccessTo10MHz CHAR(1),
    WouldApplicationReduceTheNumberOfEntitiesProvidingService CHAR(1),
    WillFacilitiesBeUsedToProvideMultiChannelVideoProgramming CHAR(1),
    AttributableInterestsInACableTelevisionSystem CHAR(1),
    ComplyWithProgrammingRequirements CHAR(1),
    RequiredToFileForm602 CHAR(1),
    Form602FileNumber CHAR(14),
    IsFilingLeadApplicationNotification CHAR(1),
    IsApplicantAPublicSafetyEntity CHAR(1),
    IfFilingIsALongTermDeFactoTransferLease CHAR(1),
    DoesFilingInvolveOneOrMorePointToPointMicrowaveLinks CHAR(1),
    SixHundredMHzGeographicOverlap CHAR(1),
    SixHundredMHzReservedSpectrum CHAR(1),
    SeekingARuralServiceProviderBiddingCredit CHAR(1),
    AnswerToTheSpectrumAggregationLimitCertificationsPL CHAR(1),
    AnswerToTheSpectrumAggregationLimitCertificationsPK CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- BD (Bidding Credits)
CREATE TABLE IF NOT EXISTS BD (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    FileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    InvolvesBiddingCredits CHAR(1),
    InvolvesInstallmentPayments CHAR(1),
    InvolvesClosedBidding CHAR(1),
    HaveFullAmountOfBiddingCreditsBeenPaid CHAR(1),
    BCQualifiesTheSameAsCurrentLicensee CHAR(1),
    BCQualifiesDifferentThanCurrentLicensee CHAR(1),
    BCDoesNotQualify CHAR(1),
    HaveInstallmentPaymentsBeenPaid CHAR(1),
    IPQualifiesTheSameAsCurrentLicensee CHAR(1),
    IPQualifiesDifferentThanCurrentLicensee CHAR(1),
    IPDoesNotQualify CHAR(1),
    HaveAllConstructionNotificationsBeenFiled CHAR(1),
    CBQualifiesForClosedBidding CHAR(1),
    CBDoesNotQualifyForClosedBidding CHAR(1),
    BCDoesTheLesseeHaveAGeneralPartnershipInterest CHAR(1),
    BCIsTheLesseeAControllingInterestOrAffiliate CHAR(1),
    BCDoesTheLicenseeCertifyThatTheLesseeDoesNotAffect CHAR(1),
    BCShareOfficeSpaceWithAnyPartyControllingTheEntity CHAR(1),
    IPHaveBothTheLicenseeAndLesseeExecuted CHAR(1),
    IPDoesTheLesseeHaveAGeneralPartnershipInterest CHAR(1),
    IPIsTheLesseeAControllingInterestOrAffiliate CHAR(1),
    IPDoesTheLicenseeCertifyThatTheLesseeDoesNotAffect CHAR(1),
    IPShareOfficeSpaceWithAnyPartyControllingTheEntity CHAR(1),
    IPModificationOfSecurityAgreementDate DATE,
    IPLienAcknowledgementDate DATE,
    CBDoesTheLesseeHaveAGeneralPartnershipInterest CHAR(1),
    CBIsTheLesseeAControllingInterestOrAffiliate CHAR(1),
    CBDoesTheLicenseeCertifyThatTheLesseeDoesNotAffect CHAR(1),
    CBShareOfficeSpaceWithAnyPartyControllingTheEntity CHAR(1),
    BiddingCreditType CHAR(1),
    BiddingCreditPercent CHAR(3),
    BiddingCreditSpectrumCapacity CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AS (Associated Call Sign)
CREATE TABLE IF NOT EXISTS AS_TABLE (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    AssociatedCallSign CHAR(10),
    StatusCode CHAR(1),
    StatusDate DATE,
    ActionPerformed CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, AssociatedCallSign),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CF (Call Sign / File Number)
CREATE TABLE IF NOT EXISTS CF (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    ItemTypeIndicator CHAR(1),
    ItemType CHAR(14),
    Constructed CHAR(1),
    LocationNumber INTEGER,
    PathNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    NumberOfMobiles INTEGER,
    CFActionPerformed CHAR(1),
    ActualDateOfConstruction DATE,
    FrequencyNumber INTEGER,
    AssignCallsign CHAR(10),
    PRIMARY KEY (UniqueSystemIdentifier, ItemType, FrequencyAssigned),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- IA (International Address)
CREATE TABLE IF NOT EXISTS IA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    InternationalAddress1 VARCHAR(60),
    InternationalAddress2 VARCHAR(60),
    InternationalCity VARCHAR(20),
    Country VARCHAR(20),
    InternationalZipCode VARCHAR(20),
    InternationalPhone CHAR(20),
    InternationalFax CHAR(20),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SC (Special Condition)
CREATE TABLE IF NOT EXISTS SC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    SpecialConditionType CHAR(1),
    SpecialConditionCode INT,
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, SpecialConditionType, SpecialConditionCode),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SF (License Free Form Special Condition)
CREATE TABLE IF NOT EXISTS SF (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LicenseFreeFormType CHAR(1),
    UniqueLicenseFreeFormIdentifier DECIMAL(9,0),
    SequenceNumber INTEGER,
    LicenseFreeFormCondition VARCHAR(255),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, UniqueLicenseFreeFormIdentifier, SequenceNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- UA (Cellular Unserved Area)
CREATE TABLE IF NOT EXISTS UA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ActionPerformed CHAR(1),
    CellularPhase INTEGER,
    MarketCode CHAR(6),
    SubmarketCode INTEGER,
    ChannelBlock CHAR(4),
    ClaimingUnservedArea CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, MarketCode, SubmarketCode),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AC (Aircraft)
CREATE TABLE IF NOT EXISTS AC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    AircraftCount INTEGER,
    TypeOfCarrier CHAR(1),
    PortableIndicator CHAR(1),
    FleetIndicator CHAR(1),
    NNumber CHAR(10),
    PRIMARY KEY (UniqueSystemIdentifier, NNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AM (Amateur)
CREATE TABLE IF NOT EXISTS AM (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    OperatorClass CHAR(1),
    GroupCode CHAR(1),
    RegionCode TINYINT,
    TrusteeCallSign CHAR(10),
    TrusteeIndicator CHAR(1),
    PhysicianCertification CHAR(1),
    VESignature CHAR(1),
    SystematicCallSignChange CHAR(1),
    VanityCallSignChange CHAR(1),
    VanityRelationship CHAR(12),
    PreviousCallSign CHAR(10),
    PreviousOperatorClass CHAR(1),
    TrusteeName VARCHAR(50),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- VC (Vanity Call Sign)
CREATE TABLE IF NOT EXISTS VC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    OrderOfPreference INTEGER,
    RequestedCallSign CHAR(10),
    PRIMARY KEY (UniqueSystemIdentifier, OrderOfPreference),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MK (Market)
CREATE TABLE IF NOT EXISTS MK (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    MarketCode CHAR(6),
    ChannelBlock CHAR(4),
    SubmarketCode INTEGER,
    MarketName CHAR(30),
    CoveragePartitioning CHAR(1),
    CoverageDissagregation CHAR(1),
    CellularPhaseID SMALLINT,
    Population DECIMAL(9,0),
    TribalCreditIndicator CHAR(1),
    TribalCreditCalculation DECIMAL(15,2),
    AdditionalTribalCreditRequested DECIMAL(15,2),
    TribalCreditAwarded DECIMAL(15,2),
    AdditionalTribalCreditAwarded DECIMAL(15,2),
    BiddingCreditPercentage DECIMAL(5,4),
    OpenClosedBidding CHAR(1),
    BiddingCreditType CHAR(1),
    ClaimingUnservedArea CHAR(1),
    RelocationOfIncumbentLicenses CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, MarketCode, ChannelBlock),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- TL (Tribal Land)
CREATE TABLE IF NOT EXISTS TL (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    MarketCode CHAR(6),
    ChannelBlock CHAR(4),
    ActionPerformed CHAR(1),
    TribalLandName VARCHAR(80),
    TribalCertification CHAR(1),
    TribalLandType VARCHAR(10),
    SquareKilometers DECIMAL(8,0),
    PRIMARY KEY (UniqueSystemIdentifier, MarketCode, ChannelBlock, TribalLandName),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MC (Market Coordinate)
CREATE TABLE IF NOT EXISTS MC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    PartitionAreaID DECIMAL(9,0),
    CoordinateSequenceId INTEGER,
    PartitionLatitudeDegrees INTEGER,
    PartitionLatitudeMinutes INTEGER,
    PartitionLatitudeSeconds DECIMAL(3,1),
    PartitionLatitudeDirection CHAR(1),
    PartitionLongitudeDegrees INTEGER,
    PartitionLongitudeMinutes INTEGER,
    PartitionLongitudeSeconds DECIMAL(3,1),
    PartitionLongitudeDirection CHAR(1),
    UndefinedPartitionedArea INTEGER,
    PRIMARY KEY (UniqueSystemIdentifier, PartitionAreaID, CoordinateSequenceId),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MF (Market Frequency)
CREATE TABLE IF NOT EXISTS MF (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    PartitionAreaID DECIMAL(9,0),
    LowerFrequency DECIMAL(16,8),
    UpperFrequency DECIMAL(16,8),
    Def_Undef_Ind CHAR(1),
    DefinedPartitionArea CHAR(6),
    PRIMARY KEY (UniqueSystemIdentifier, PartitionAreaID, LowerFrequency, UpperFrequency),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MP (Market Partition)
CREATE TABLE IF NOT EXISTS MP (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    MarketPartitionCode CHAR(6),
    DefinedPartitionArea VARCHAR(60),
    DefinedAreaPopulation DECIMAL(9,0),
    IncludeExcludeIndicator CHAR(1),
    PartitionAreaID DECIMAL(9,0),
    ActionPerformed CHAR(1),
    CensusFigures INTEGER,
    Def_Undef_Ind CHAR(1),
    PartitionSequenceNumber INTEGER,
    WhitespaceIndicator CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, PartitionAreaID),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LS (Location Special Condition)
CREATE TABLE IF NOT EXISTS LS (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    SpecialConditionType CHAR(1),
    SpecialConditionCode INTEGER,
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, SpecialConditionType, SpecialConditionCode),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LO (Location)
CREATE TABLE IF NOT EXISTS LO (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationTypeCode CHAR(1),
    LocationClassCode CHAR(1),
    LocationNumber INTEGER,
    SiteStatus CHAR(1),
    CorrespondingFixedLocation INTEGER,
    LocationAddress VARCHAR(80),
    LocationCity CHAR(20),
    LocationCounty VARCHAR(60),
    LocationState CHAR(2),
    RadiusOfOperation DECIMAL(5,1),
    AreaOfOperationCode CHAR(1),
    ClearanceIndicator CHAR(1),
    GroundElevation DECIMAL(7,1),
    LatitudeDegrees INTEGER,
    LatitudeMinutes INTEGER,
    LatitudeSeconds DECIMAL(3,1),
    LatitudeDirection CHAR(1),
    LongitudeDegrees INTEGER,
    LongitudeMinutes INTEGER,
    LongitudeSeconds DECIMAL(3,1),
    LongitudeDirection CHAR(1),
    MaxLatitudeDegrees INTEGER,
    MaxLatitudeMinutes INTEGER,
    MaxLatitudeSeconds DECIMAL(3,1),
    MaxLatitudeDirection CHAR(1),
    MaxLongitudeDegrees INTEGER,
    MaxLongitudeMinutes INTEGER,
    MaxLongitudeSeconds DECIMAL(3,1),
    MaxLongitudeDirection CHAR(1),
    Nepa CHAR(1),
    QuietZoneNotificationDate DATE,
    TowerRegistrationNumber CHAR(10),
    HeightOfSupportStructure DECIMAL(7,1),
    OverallHeightOfStructure DECIMAL(7,1),
    StructureType CHAR(7),
    AirportID CHAR(4),
    LocationName CHAR(20),
    UnitsHandHeld INTEGER,
    UnitsMobile INTEGER,
    UnitsTempFixed INTEGER,
    UnitsAircraft INTEGER,
    UnitsItinerant INTEGER,
    StatusCode CHAR(1),
    StatusDate DATE,
    EarthStationAgreement CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LA (Location Address)
CREATE TABLE IF NOT EXISTS LA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AddressLine1 VARCHAR(60),
    AddressLine2 VARCHAR(60),
    POBox VARCHAR(20),
    City VARCHAR(20),
    State CHAR(2),
    ZipCode CHAR(9),
    AttentionLine VARCHAR(35),
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LF (Location Free Form)
CREATE TABLE IF NOT EXISTS LF (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    UniqueLocationFreeFormIdentifier DECIMAL(9,0),
    SequenceNumber INTEGER,
    LocationFreeFormCondition VARCHAR(255),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, UniqueLocationFreeFormIdentifier, SequenceNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LH (Location History)
CREATE TABLE IF NOT EXISTS LH (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationTypeCode CHAR(1),
    LocationClassCode CHAR(1),
    LocationNumber INTEGER,
    SiteStatus CHAR(1),
    CorrespondingFixedLocation INTEGER,
    LocationAddress VARCHAR(80),
    LocationCity CHAR(20),
    LocationCounty VARCHAR(60),
    LocationState CHAR(2),
    RadiusOfOperation DECIMAL(5,1),
    AreaOfOperationCode CHAR(1),
    ClearanceIndicator CHAR(1),
    GroundElevation DECIMAL(7,1),
    LatitudeDegrees INTEGER,
    LatitudeMinutes INTEGER,
    LatitudeSeconds DECIMAL(3,1),
    LatitudeDirection CHAR(1),
    LongitudeDegrees INTEGER,
    LongitudeMinutes INTEGER,
    LongitudeSeconds DECIMAL(3,1),
    LongitudeDirection CHAR(1),
    MaxLatitudeDegrees INTEGER,
    MaxLatitudeMinutes INTEGER,
    MaxLatitudeSeconds DECIMAL(3,1),
    MaxLatitudeDirection CHAR(1),
    MaxLongitudeDegrees INTEGER,
    MaxLongitudeMinutes INTEGER,
    MaxLongitudeSeconds DECIMAL(3,1),
    MaxLongitudeDirection CHAR(1),
    Nepa CHAR(1),
    QuietZoneNotificationDate DATE,
    TowerRegistrationNumber CHAR(10),
    HeightOfSupportStructure DECIMAL(7,1),
    OverallHeightOfStructure DECIMAL(7,1),
    StructureType CHAR(7),
    AirportID CHAR(4),
    LocationName CHAR(20),
    UnitsHandHeld INTEGER,
    UnitsMobile INTEGER,
    UnitsTempFixed INTEGER,
    UnitsAircraft INTEGER,
    UnitsItinerant INTEGER,
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- PC (Path Coordinate)
CREATE TABLE IF NOT EXISTS PC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    PathNumber INTEGER,
    LatitudeDegrees INTEGER,
    LatitudeMinutes INTEGER,
    LatitudeSeconds DECIMAL(3,1),
    LatitudeDirection CHAR(1),
    LongitudeDegrees INTEGER,
    LongitudeMinutes INTEGER,
    LongitudeSeconds DECIMAL(3,1),
    LongitudeDirection CHAR(1),
    ElevationOfSite DECIMAL(7,1),
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, PathNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- PI (Path Itinerant Area)
CREATE TABLE IF NOT EXISTS PI (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    PathNumber INTEGER,
    CoordinateType CHAR(1),
    LatitudeDegrees INTEGER,
    LatitudeMinutes INTEGER,
    LatitudeSeconds DECIMAL(3,1),
    LatitudeDirection CHAR(1),
    LongitudeDegrees INTEGER,
    LongitudeMinutes INTEGER,
    LongitudeSeconds DECIMAL(3,1),
    LongitudeDirection CHAR(1),
    AreaOperationKeyLetter CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, PathNumber, CoordinateType),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- PA (Path)
CREATE TABLE IF NOT EXISTS PA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    PathNumber INTEGER,
    PathTypeCode CHAR(1),
    FacilityTypeCode CHAR(1),
    PassiveReceiverId CHAR(10),
    PathStatus CHAR(1),
    ReceiverLatitudeDegrees INTEGER,
    ReceiverLatitudeMinutes INTEGER,
    ReceiverLatitudeSeconds DECIMAL(3,1),
    ReceiverLatitudeDirection CHAR(1),
    ReceiverLongitudeDegrees INTEGER,
    ReceiverLongitudeMinutes INTEGER,
    ReceiverLongitudeSeconds DECIMAL(3,1),
    ReceiverLongitudeDirection CHAR(1),
    ReceiverSiteElevation DECIMAL(7,1),
    TransmitterLatitudeDegrees INTEGER,
    TransmitterLatitudeMinutes INTEGER,
    TransmitterLatitudeSeconds DECIMAL(3,1),
    TransmitterLatitudeDirection CHAR(1),
    TransmitterLongitudeDegrees INTEGER,
    TransmitterLongitudeMinutes INTEGER,
    TransmitterLongitudeSeconds DECIMAL(3,1),
    TransmitterLongitudeDirection CHAR(1),
    TransmitterSiteElevation DECIMAL(7,1),
    PathDistance DECIMAL(5,1),
    TXAntennaMake CHAR(25),
    TXAntennaModel CHAR(25),
    TXAntennaGain DECIMAL(5,1),
    TXBandwidth DECIMAL(7,1),
    TXAntennaBeamwidth DECIMAL(4,1),
    TXAntennaBeamdegrees DECIMAL(5,1),
    TXAntennaHeight DECIMAL(7,1),
    TXAntennaDiversity CHAR(1),
    TXAntennaPolarization CHAR(1),
    TXFrequencyTolerance DECIMAL(6,6),
    TXFrequencyToleType CHAR(1),
    TXAntennaSequenceID INTEGER,
    RXAntennaMake CHAR(25),
    RXAntennaModel CHAR(25),
    RXAntennaGain DECIMAL(5,1),
    RXBandwidth DECIMAL(7,1),
    RXAntennaBeamwidth DECIMAL(4,1),
    RXAntennaBeamdegrees DECIMAL(5,1),
    RXAntennaHeight DECIMAL(7,1),
    RXAntennaDiversity CHAR(1),
    RXAntennaPolarization CHAR(1),
    RXAntennaSequenceID INTEGER,
    InterferenceStudyFlag CHAR(1),
    EnvironmentalFlag CHAR(1),
    GlintStudyFlag CHAR(1),
    FAA_Notification_Flag CHAR(1),
    FAA_Notification_Date DATE,
    AdjacentChannelStudyFlag CHAR(1),
    TransmitPolarization CHAR(1),
    TXAntennaTiltDegrees DECIMAL(4,1),
    ReceivePolarization CHAR(1),
    RXAntennaTiltDegrees DECIMAL(4,1),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, PathNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FR (Frequency)
CREATE TABLE IF NOT EXISTS FR (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    ClassStationCode CHAR(4),
    OpAltitudeCode CHAR(2),
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    FrequencyCarrier DECIMAL(16,8),
    TimeBeginOperation TIME,
    TimeEndOperation TIME,
    PowerOutput DECIMAL(15,3),
    PowerERP DECIMAL(15,3),
    Tolerance DECIMAL(6,6),
    FrequencyIndicator CHAR(1),
    FrequencyStatus CHAR(1),
    BuildOutFrequencyStatus CHAR(1),
    ChannelNumber DECIMAL(6,1),
    ChannelPrefix CHAR(10),
    TransmitterMake CHAR(25),
    TransmitterModel CHAR(25),
    AutoTransControl CHAR(1),
    NumberOfMobiles INTEGER,
    NumberOfPagers INTEGER,
    NumberofUnits INTEGER,
    StatusCode CHAR(1),
    StatusDate DATE,
    SpectrumStatus CHAR(1),
    PublicSafetyNationwide CHAR(1),
    TBandReallocation CHAR(1),
    TBandTrackingId CHAR(10),
    ReplacementFrequency DECIMAL(16,8),
    SpecialConditionId INTEGER,
    SpecialConditionCrossRef INTEGER,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, AntennaNumber, FrequencyAssigned),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- EM (Emission)
CREATE TABLE IF NOT EXISTS EM (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    EmissionCode CHAR(10),
    EmissionDesignator CHAR(3),
    EmissionActionPerformed CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, AntennaNumber, FrequencyAssigned, EmissionCode),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FS (Frequency Special Condition)
CREATE TABLE IF NOT EXISTS FS (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    SpecialConditionType CHAR(1),
    SpecialConditionCode INTEGER,
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, AntennaNumber, FrequencyAssigned, SpecialConditionType, SpecialConditionCode),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FF (Frequency Free Form)
CREATE TABLE IF NOT EXISTS FF (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    UniqueFrequencyFreeFormIdentifier DECIMAL(9,0),
    SequenceNumber INTEGER,
    FrequencyFreeFormCondition VARCHAR(255),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, AntennaNumber, FrequencyAssigned, UniqueFrequencyFreeFormIdentifier, SequenceNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FH (Frequency History)
CREATE TABLE IF NOT EXISTS FH (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    ClassStationCode CHAR(4),
    OpAltitudeCode CHAR(2),
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    FrequencyCarrier DECIMAL(16,8),
    TimeBeginOperation TIME,
    TimeEndOperation TIME,
    PowerOutput DECIMAL(15,3),
    PowerERP DECIMAL(15,3),
    Tolerance DECIMAL(6,6),
    FrequencyIndicator CHAR(1),
    FrequencyStatus CHAR(1),
    ChannelNumber DECIMAL(6,1),
    ChannelPrefix CHAR(10),
    TransmitterMake CHAR(25),
    TransmitterModel CHAR(25),
    AutoTransControl CHAR(1),
    NumberOfMobiles INTEGER,
    NumberOfPagers INTEGER,
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, AntennaNumber, FrequencyAssigned),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- O2 (Supplemental Ownership)
CREATE TABLE IF NOT EXISTS O2 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    ApplicantTypeCode CHAR(1),
    ApplicantTypeCodeOther VARCHAR(40),
    AliensOwnershipQuestion CHAR(1),
    AlienOfficerQuestion CHAR(1),
    AliensControlQuestion CHAR(1),
    RadioServiceType CHAR(1),
    NoOfRadioServices INTEGER,
    NoOfFeederLink INTEGER,
    NoOfSpaceStations INTEGER,
    FixedSatelliteEarthStations CHAR(1),
    TemporarySatelliteEarthStations CHAR(1),
    MobileSatelliteEarthStations CHAR(1),
    GeostationarySatelliteOrbit CHAR(1),
    NonGeostationarySatelliteOrbit CHAR(1),
    OtherSatelliteService VARCHAR(255),
    PriorFCCExperience VARCHAR(255),
    IntendedUsePurpose VARCHAR(255),
    IntlRegisteredName VARCHAR(100),
    FCCFRNRegistered CHAR(1),
    UseFCC606 CHAR(1),
    StatutoryReason CHAR(1),
    RequestingConfidentiality CHAR(1),
    ExtentOfConfidentialTreatmentRequested CHAR(1),
    ExtentOfConfidentialTreatmentRequested_Other VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- OP (Ownership)
CREATE TABLE IF NOT EXISTS OP (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    EntityType CHAR(1),
    LicenseeID VARCHAR(9),
    EntityName VARCHAR(200),
    FirstName VARCHAR(20),
    MI CHAR(1),
    LastName VARCHAR(20),
    Suffix CHAR(3),
    Phone VARCHAR(10),
    Fax VARCHAR(10),
    Internet VARCHAR(50),
    StreetAddress VARCHAR(60),
    City VARCHAR(20),
    State CHAR(2),
    ZipCode CHAR(9),
    POBox VARCHAR(20),
    AttentionLine VARCHAR(35),
    SGIN CHAR(3),
    IndividualEntityType CHAR(1),
    PositionOfInterest VARCHAR(30),
    PositionType VARCHAR(20),
    Ethnicity CHAR(1),
    Gender CHAR(1),
    InterestType VARCHAR(20),
    HowObtained VARCHAR(30),
    HowObtained_Other VARCHAR(30),
    GrossRevenue DECIMAL(15,2),
    PercentVotingInterest DECIMAL(5,2),
    PercentEquityInterest DECIMAL(5,2),
    PercentVotingInterestActiveParticipation DECIMAL(5,2),
    AmountInvestedInTheStation DECIMAL(15,2),
    OtherFCCRegulatedBusinesses VARCHAR(255),
    OtherMediaInterests VARCHAR(255),
    OtherMobileCellularInterests VARCHAR(255),
    ApplicantSubjectToDenial CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    Citizenship VARCHAR(20),
    IsCitizen CHAR(1),
    PriorFCCViolation CHAR(1),
    FRN VARCHAR(10),
    WAIVERS CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, EntityType),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CP (Controlling Party)
CREATE TABLE IF NOT EXISTS CP (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    EntityName VARCHAR(200),
    FirstName VARCHAR(20),
    MI CHAR(1),
    LastName VARCHAR(20),
    Suffix CHAR(3),
    Phone VARCHAR(10),
    Fax VARCHAR(10),
    Internet VARCHAR(50),
    StreetAddress VARCHAR(60),
    City VARCHAR(20),
    State CHAR(2),
    ZipCode CHAR(9),
    POBox VARCHAR(20),
    AttentionLine VARCHAR(35),
    SGIN CHAR(3),
    HowRelated VARCHAR(30),
    PositionOfInterest VARCHAR(30),
    PositionType VARCHAR(20),
    CtizenshipCountry VARCHAR(20),
    Ethnicity CHAR(1),
    Gender CHAR(1),
    InterestType VARCHAR(20),
    HowObtained VARCHAR(30),
    HowObtained_Other VARCHAR(30),
    PercentVotingInterest DECIMAL(5,2),
    PercentEquityInterest DECIMAL(5,2),
    PercentVotingInterestActiveParticipation DECIMAL(5,2),
    BasisOfEligibility VARCHAR(255),
    OtherBasisOfEligibility VARCHAR(255),
    ApplicationSubjectToDenial CHAR(1),
    InterestBasis CHAR(1),
    InterestDiscrepancy CHAR(1),
    InterestDiscrepancyExplanation VARCHAR(255),
    StatusCode CHAR(1),
    StatusDate DATE,
    FRN VARCHAR(10),
    EntityType CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, EntityName, FirstName, LastName),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AN (Antenna)
CREATE TABLE IF NOT EXISTS AN (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    AntennaTypeCode CHAR(1),
    HeightToTip DECIMAL(5,1),
    HeightToCenter DECIMAL(5,1),
    AntennaPlacement CHAR(1),
    AntennaUtilization CHAR(1),
    AntennaSupport CHAR(1),
    Directional CHAR(1),
    AntennaManufacturer CHAR(25),
    AntennaModel CHAR(25),
    HeightAboveGroundLevel DECIMAL(5,1),
    DiversityAntennaNumber INTEGER,
    BeamTypeCode CHAR(1),
    BeamTypeSector INTEGER,
    RotatedBeamHeading DECIMAL(4,1),
    BeamAntennaGain DECIMAL(5,1),
    BeamWidth DECIMAL(4,1),
    RotatedElevationAngle DECIMAL(5,1),
    BeamDegree DECIMAL(5,1),
    TiltDegree DECIMAL(4,1),
    PolarizationType CHAR(1),
    AntennaSequenceId INTEGER,
    AntennaActionPerformed CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, AntennaNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- F2 (Additional Frequency)
CREATE TABLE IF NOT EXISTS F2 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    IsMobileFrequency CHAR(1),
    ReceiverFacilities CHAR(1),
    WitnessTime TIME,
    WitnessDate DATE,
    PassbandLowFrequency DECIMAL(16,8),
    PassbandHighFrequency DECIMAL(16,8),
    EmissionLowFrequency DECIMAL(16,8),
    EmissionHighFrequency DECIMAL(16,8),
    ModulatingSignalLowFrequency DECIMAL(16,8),
    ModulatingSignalHighFrequency DECIMAL(16,8),
    RFChannelCenterFrequency DECIMAL(16,8),
    LowerTuningLimit DECIMAL(16,8),
    UpperTuningLimit DECIMAL(16,8),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, AntennaNumber, FrequencyAssigned),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- RZ (Radio Zone)
CREATE TABLE IF NOT EXISTS RZ (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ZoneSequenceId INTEGER,
    ZoneCode CHAR(6),
    PRIMARY KEY (UniqueSystemIdentifier, ZoneSequenceId),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- RC (Regulatory Compliance)
CREATE TABLE IF NOT EXISTS RC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    RegulatoryComplianceQuestion CHAR(1),
    RegulatoryComplianceCode CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, RegulatoryComplianceQuestion),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AG (Agent)
CREATE TABLE IF NOT EXISTS AG (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    AgentFirstName VARCHAR(20),
    AgentMI CHAR(1),
    AgentLastName VARCHAR(20),
    AgentSuffix CHAR(3),
    AgentCompanyName VARCHAR(200),
    AgentStreet VARCHAR(60),
    AgentCity VARCHAR(20),
    AgentState CHAR(2),
    AgentZipCode CHAR(9),
    AgentPOBox VARCHAR(20),
    AgentAttentionLine VARCHAR(35),
    AgentPhone VARCHAR(10),
    AgentFax VARCHAR(10),
    AgentEmail VARCHAR(50),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, AgentLastName, AgentFirstName, AgentCompanyName),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SP (Special Provision Condition)
CREATE TABLE IF NOT EXISTS SP (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    SpecialConditionType CHAR(1),
    SpecialConditionCode INTEGER,
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, SpecialConditionType, SpecialConditionCode),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MS (Market Summary)
CREATE TABLE IF NOT EXISTS MS (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    MarketPartitionType CHAR(1),
    MarketArea CHAR(6),
    MarketAreaName VARCHAR(60),
    MarketSurface DECIMAL(15,2),
    MarketPopulation DECIMAL(9,0),
    TribalLandIndicator CHAR(1),
    TribalLandType VARCHAR(10),
    TribalLandAggregation DECIMAL(16,2),
    TribalLandPopulation DECIMAL(9,0),
    PRIMARY KEY (UniqueSystemIdentifier, MarketPartitionType, MarketArea),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- WA (Waiver Request)
CREATE TABLE IF NOT EXISTS WA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    WaiverNumber INTEGER,
    WaiverDescription VARCHAR(255),
    WaiverRequestDenial CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, WaiverNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- L3 (Geographic Coverage)
CREATE TABLE IF NOT EXISTS L3 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    LocationCoverageType CHAR(1),
    LocationCoverageValue VARCHAR(255),
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, LocationCoverageType),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AT (Attachments)
CREATE TABLE IF NOT EXISTS AT (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    AttachmentCode CHAR(1),
    AttachmentDescription VARCHAR(60),
    AttachmentDate DATE,
    AttachmentFileName VARCHAR(60),
    ActionPerformed CHAR(1),
    PRIMARY KEY (UniqueSystemIdentifier, AttachmentCode, AttachmentFileName),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- F3 (Registration)
CREATE TABLE IF NOT EXISTS F3 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FacilityRegistrationAction CHAR(1),
    FacilityIdRegistered INTEGER,
    FacilityTypeCode CHAR(1),
    FacilityTypeIndustry CHAR(20),
    FacilityCallSign CHAR(10),
    TempoOrPermanent CHAR(1),
    CommunicationServices CHAR(1),
    InterconnectedService CHAR(1),
    RadioServiceTypeCode CHAR(1),
    NumberOfVehicles INTEGER,
    NumberOfUnits INTEGER,
    NumberOfMobileUnits INTEGER,
    NumberOfPortableUnits INTEGER,
    NumberOfPagers INTEGER,
    NumberOfOtherUnits INTEGER,
    FacilityID INTEGER,
    FacilityCity VARCHAR(20),
    FacilityState CHAR(2),
    PRIMARY KEY (UniqueSystemIdentifier, FacilityIdRegistered),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CS (Call Sign History)
CREATE TABLE IF NOT EXISTS CS (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LogDate DATE,
    Code CHAR(6),
    PRIMARY KEY (UniqueSystemIdentifier, LogDate, Code),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- BO (Broadcast)
CREATE TABLE IF NOT EXISTS BO (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0) PRIMARY KEY,
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FacilityID INTEGER,
    ShortFormFlag CHAR(1),
    StatementOfCriteriaFlag CHAR(1),
    GeoZoneFlag CHAR(1),
    GeoZoneType VARCHAR(15),
    GeoZoneCounty VARCHAR(20),
    GeoZoneState CHAR(2),
    AlphabeticCallSignIndicator CHAR(1),
    LabelIndicator CHAR(1),
    FirstCommunityNumber INTEGER,
    FirstState CHAR(2),
    FirstCity VARCHAR(20),
    ChannelNumber DECIMAL(6,1),
    SecondCommunityNumber INTEGER,
    SecondState CHAR(2),
    SecondCity VARCHAR(20),
    OperatingHours CHAR(1),
    ReservedForFutureUse VARCHAR(30),
    ClassifierID CHAR(8),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CC (Call Sign Change)
CREATE TABLE IF NOT EXISTS CC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    SequenceNumber INTEGER,
    RequestedCallSign CHAR(10),
    PreferenceIndicator CHAR(1),
    PreferenceReason CHAR(1),
    PreferenceOther VARCHAR(255),
    PRIMARY KEY (UniqueSystemIdentifier, SequenceNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- PS (Paging)
CREATE TABLE IF NOT EXISTS PS (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    PageTypeCode CHAR(1),
    TapeTypeCode CHAR(1),
    TapeSpeed DECIMAL(4,1),
    SignalDurationCode CHAR(1),
    PagerCodes INTEGER,
    Seconds DECIMAL(3,1),
    CapabilityCode CHAR(1),
    STATUS CHAR(1),
    ReservedCode VARCHAR(10),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- TP (Tower Painting)
CREATE TABLE IF NOT EXISTS TP (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    TowerPaintingActionPerformed CHAR(1),
    PaintingStartHeight DECIMAL(6,1),
    PaintingEndHeight DECIMAL(6,1),
    PaintingTypeCode CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, PaintingStartHeight),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LW (Tower Lighting)
CREATE TABLE IF NOT EXISTS LW (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    LightingActionPerformed CHAR(1),
    LightingStatusCode CHAR(1),
    LightingStartHeight DECIMAL(6,1),
    LightingTypeCode CHAR(3),
    FAA_Approval_Date DATE,
    FAA_CircularNumber CHAR(5),
    StatusCode CHAR(1),
    StatusDate DATE,
    PRIMARY KEY (UniqueSystemIdentifier, LocationNumber, LightingTypeCode),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);
-- Additional Tables for ULS Schema
-- Generated based on public_access_database_definitions_20240215.txt
-- This script adds missing tables to complete the ULS schema implementation

-- Naming convention note: AS table is implemented as AS_TABLE since AS is a reserved word in SQL

-- A3 table (if the table is already named AS_TABLE, we don't need to add another AS table)
CREATE TABLE IF NOT EXISTS A3 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    ReasonCode CHAR(2),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AH (Additional MM Application Attachment Information)
CREATE TABLE IF NOT EXISTS AH (
    RecordType CHAR(2),
    ULSFileNumber CHAR(14),
    AttachmentDescription VARCHAR(60),
    AttachmentFileID CHAR(18)
);

-- BE (BRS / EBS Specific Questions)
CREATE TABLE IF NOT EXISTS BE (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    Multichannel CHAR(1),
    CableTv CHAR(1),
    ProgrammingRequirements CHAR(1),
    InterferenceProtection CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- BF (Buildout Frequency)
CREATE TABLE IF NOT EXISTS BF (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    BuildoutCode INTEGER,
    BuildoutDeadline DATE,
    BuildoutDate DATE,
    StatusCode CHAR(1),
    StatusDate DATE,
    FrequencyNumber INTEGER,
    DiscontinuanceDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- BL (Buildout Location)
CREATE TABLE IF NOT EXISTS BL (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    Location INTEGER,
    BuildoutCode INTEGER,
    BuildoutDeadline DATE,
    BuildoutDate DATE,
    StatusCode CHAR(1),
    StatusDate DATE,
    DiscontinuanceDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CD (Children's Television)
CREATE TABLE IF NOT EXISTS CD (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    ProgramsDesignated CHAR(1),
    PublicizedDesignation CHAR(1),
    IssuesListed CHAR(1),
    EducationalNeeds CHAR(1),
    ParentsInformed CHAR(1),
    LimitCommercialMatter CHAR(1),
    CommercialLimitedTo CHAR(2),
    CompliancePercent CHAR(3),
    PreemptionPolicy CHAR(1),
    Status CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- EC (Emissions Characteristics)
CREATE TABLE IF NOT EXISTS EC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    EmissionNumber INTEGER,
    EmissionDesignator CHAR(11),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- F4, F5, F6 (Additional Frequency Tables)
CREATE TABLE IF NOT EXISTS F4 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS F5 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS F6 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FT (Frequency Type)
CREATE TABLE IF NOT EXISTS FT (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyTypeActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyTypeNumber INTEGER,
    FrequencyTypeCode CHAR(2),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- IF (Interface) - Renamed to IF_TABLE since IF is a reserved keyword
CREATE TABLE IF NOT EXISTS IF_TABLE (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    InterfaceNumber INTEGER,
    InterfaceCode CHAR(4),
    InterfaceType CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- IR (IRAC)
CREATE TABLE IF NOT EXISTS IR (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    IRACResults CHAR(2),
    FASDocketNumber CHAR(8),
    FCCMNumber CHAR(10),
    FAANGNumber CHAR(11),
    StatusCode CHAR(1),
    StatusDate DATE,
    CoordinationStatusCode SMALLINT,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- L2 (Additional Location Data)
CREATE TABLE IF NOT EXISTS L2 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    RegistrationRequired CHAR(1),
    ProtectionDate DATETIME,
    LinkRegistrationNumber VARCHAR(30),
    LinkRegistrationNumberAction CHAR(1),
    MexicoClearanceIndicator CHAR(1),
    QuietZoneConsent CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- L4, L5, L6 (Additional Location Tables)
CREATE TABLE IF NOT EXISTS L4 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS L5 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS L6 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LC (Location County)
CREATE TABLE IF NOT EXISTS LC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    CountyCode CHAR(5),
    CountyName VARCHAR(60),
    StateCode CHAR(2),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LD (Lease Dates)
CREATE TABLE IF NOT EXISTS LD (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LeaseCommencementDate DATE,
    LeaseRevisedExpirationDate DATE,
    LeaseTerminationDate DATE,
    LeaseNeverCommenced VARCHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LL (Location Line Segment)
CREATE TABLE IF NOT EXISTS LL (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    LineSegmentNumber INTEGER,
    LatitudeDegrees1 INTEGER,
    LatitudeMinutes1 INTEGER,
    LatitudeSeconds1 DECIMAL(3,1),
    LatitudeDirection1 CHAR(1),
    LongitudeDegrees1 INTEGER,
    LongitudeMinutes1 INTEGER,
    LongitudeSeconds1 DECIMAL(3,1),
    LongitudeDirection1 CHAR(1),
    LatitudeDegrees2 INTEGER,
    LatitudeMinutes2 INTEGER,
    LatitudeSeconds2 DECIMAL(3,1),
    LatitudeDirection2 CHAR(1),
    LongitudeDegrees2 INTEGER,
    LongitudeMinutes2 INTEGER,
    LongitudeSeconds2 DECIMAL(3,1),
    LongitudeDirection2 CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- ME (MEA Number)
CREATE TABLE IF NOT EXISTS ME (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    MEA_Number CHAR(6),
    ActionPerformed CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MH (Channel Plan Information)
CREATE TABLE IF NOT EXISTS MH (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ActionPerformed CHAR(1),
    ChannelPlanNumber CHAR(4),
    ChannelPlan CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- P2 (Path Data)
CREATE TABLE IF NOT EXISTS P2 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    PathActionPerformed CHAR(1),
    PathNumber INTEGER,
    LocationNumber1 INTEGER,
    AntennaNumber1 INTEGER,
    LocationNumber2 INTEGER,
    AntennaNumber2 INTEGER,
    PathType CHAR(1),
    PassiveRepeater CHAR(1),
    LinkDistance DECIMAL(5,1),
    InterfacePath CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- RA (Race Information)
CREATE TABLE IF NOT EXISTS RA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    EntityType CHAR(2),
    EntityID DECIMAL(9,0),
    RaceReported CHAR(1),
    Gender CHAR(1),
    Ethnicity CHAR(1),
    BlackOrAfricanAmerican CHAR(1),
    AmericanIndianOrAlaskaNative CHAR(1),
    AsianIndian CHAR(1),
    Chinese CHAR(1),
    Filipino CHAR(1),
    Japanese CHAR(1),
    Korean CHAR(1),
    Vietnamese CHAR(1),
    OtherAsian CHAR(1),
    NativeHawaiian CHAR(1),
    GuamanianOrChamorro CHAR(1),
    Samoan CHAR(1),
    OtherPacificIslander CHAR(1),
    White CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- RI (Revenue Information)
CREATE TABLE IF NOT EXISTS RI (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    EntityType CHAR(1),
    YearSequenceID SMALLINT,
    GrossRevenues DECIMAL(15,2),
    YearEndDate DATE,
    AverageGrossRevenues DECIMAL(15,2),
    AssetDisclosure DECIMAL(15,2),
    StatementType CHAR(1),
    In_Existence CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SI (SIDS)
CREATE TABLE IF NOT EXISTS SI (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ActionPerformed CHAR(1),
    SIDNumber INTEGER,
    SIDType CHAR(1),
    MarketCode CHAR(6),
    ChannelBlock CHAR(4),
    SubmarketCode INTEGER,
    SubmarketDesc VARCHAR(30),
    StationClass CHAR(4),
    DescriptiveText VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- ST (Sector)
CREATE TABLE IF NOT EXISTS ST (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    SectorActionPerformed CHAR(1),
    SectorNumber INTEGER,
    PSD_NonPSD_Methodology VARCHAR(10),
    MaximumERP DECIMAL(15,3),
    PSDAttachment CHAR(1),
    LocationNumber INTEGER,
    LocationName VARCHAR(20),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);
-- Additional Tables for ULS Schema
-- Generated based on public_access_database_definitions_20240215.txt
-- This script adds missing tables to complete the ULS schema implementation

-- Naming convention note: AS table is implemented as AS_TABLE since AS is a reserved word in SQL

-- A3 table (if the table is already named AS_TABLE, we don't need to add another AS table)
CREATE TABLE IF NOT EXISTS A3 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    ReasonCode CHAR(2),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- AH (Additional MM Application Attachment Information)
CREATE TABLE IF NOT EXISTS AH (
    RecordType CHAR(2),
    ULSFileNumber CHAR(14),
    AttachmentDescription VARCHAR(60),
    AttachmentFileID CHAR(18)
);

-- BE (BRS / EBS Specific Questions)
CREATE TABLE IF NOT EXISTS BE (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    Multichannel CHAR(1),
    CableTv CHAR(1),
    ProgrammingRequirements CHAR(1),
    InterferenceProtection CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- BF (Buildout Frequency)
CREATE TABLE IF NOT EXISTS BF (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    BuildoutCode INTEGER,
    BuildoutDeadline DATE,
    BuildoutDate DATE,
    StatusCode CHAR(1),
    StatusDate DATE,
    FrequencyNumber INTEGER,
    DiscontinuanceDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- BL (Buildout Location)
CREATE TABLE IF NOT EXISTS BL (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    Location INTEGER,
    BuildoutCode INTEGER,
    BuildoutDeadline DATE,
    BuildoutDate DATE,
    StatusCode CHAR(1),
    StatusDate DATE,
    DiscontinuanceDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- CD (Children's Television)
CREATE TABLE IF NOT EXISTS CD (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    ProgramsDesignated CHAR(1),
    PublicizedDesignation CHAR(1),
    IssuesListed CHAR(1),
    EducationalNeeds CHAR(1),
    ParentsInformed CHAR(1),
    LimitCommercialMatter CHAR(1),
    CommercialLimitedTo CHAR(2),
    CompliancePercent CHAR(3),
    PreemptionPolicy CHAR(1),
    Status CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- EC (Emissions Characteristics)
CREATE TABLE IF NOT EXISTS EC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    EmissionNumber INTEGER,
    EmissionDesignator CHAR(11),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- F4, F5, F6 (Additional Frequency Tables)
CREATE TABLE IF NOT EXISTS F4 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS F5 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS F6 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyUpperBand DECIMAL(16,8),
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- FT (Frequency Type)
CREATE TABLE IF NOT EXISTS FT (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    FrequencyTypeActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    FrequencyTypeNumber INTEGER,
    FrequencyTypeCode CHAR(2),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- IF (Interface) - Renamed to IF_TABLE to avoid SQL keyword conflict
CREATE TABLE IF NOT EXISTS IF_TABLE (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    InterfaceNumber INTEGER,
    InterfaceCode CHAR(4),
    InterfaceType CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- IR (IRAC)
CREATE TABLE IF NOT EXISTS IR (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    AntennaNumber INTEGER,
    FrequencyAssigned DECIMAL(16,8),
    IRACResults CHAR(2),
    FASDocketNumber CHAR(8),
    FCCMNumber CHAR(10),
    FAANGNumber CHAR(11),
    StatusCode CHAR(1),
    StatusDate DATE,
    CoordinationStatusCode SMALLINT,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- L2 (Additional Location Data)
CREATE TABLE IF NOT EXISTS L2 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    RegistrationRequired CHAR(1),
    ProtectionDate DATETIME,
    LinkRegistrationNumber VARCHAR(30),
    LinkRegistrationNumberAction CHAR(1),
    MexicoClearanceIndicator CHAR(1),
    QuietZoneConsent CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- L4, L5, L6 (Additional Location Tables)
CREATE TABLE IF NOT EXISTS L4 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS L5 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

CREATE TABLE IF NOT EXISTS L6 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationActionPerformed CHAR(1),
    LocationNumber INTEGER,
    AdditionalInfo VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LC (Location County)
CREATE TABLE IF NOT EXISTS LC (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    CountyCode CHAR(5),
    CountyName VARCHAR(60),
    StateCode CHAR(2),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LD (Lease Dates)
CREATE TABLE IF NOT EXISTS LD (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    LeaseCommencementDate DATE,
    LeaseRevisedExpirationDate DATE,
    LeaseTerminationDate DATE,
    LeaseNeverCommenced VARCHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- LL (Location Line Segment)
CREATE TABLE IF NOT EXISTS LL (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    LocationNumber INTEGER,
    LineSegmentNumber INTEGER,
    LatitudeDegrees1 INTEGER,
    LatitudeMinutes1 INTEGER,
    LatitudeSeconds1 DECIMAL(3,1),
    LatitudeDirection1 CHAR(1),
    LongitudeDegrees1 INTEGER,
    LongitudeMinutes1 INTEGER,
    LongitudeSeconds1 DECIMAL(3,1),
    LongitudeDirection1 CHAR(1),
    LatitudeDegrees2 INTEGER,
    LatitudeMinutes2 INTEGER,
    LatitudeSeconds2 DECIMAL(3,1),
    LatitudeDirection2 CHAR(1),
    LongitudeDegrees2 INTEGER,
    LongitudeMinutes2 INTEGER,
    LongitudeSeconds2 DECIMAL(3,1),
    LongitudeDirection2 CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- ME (MEA Number)
CREATE TABLE IF NOT EXISTS ME (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    MEA_Number CHAR(6),
    ActionPerformed CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- MH (Channel Plan Information)
CREATE TABLE IF NOT EXISTS MH (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ActionPerformed CHAR(1),
    ChannelPlanNumber CHAR(4),
    ChannelPlan CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- P2 (Path Data)
CREATE TABLE IF NOT EXISTS P2 (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    PathActionPerformed CHAR(1),
    PathNumber INTEGER,
    LocationNumber1 INTEGER,
    AntennaNumber1 INTEGER,
    LocationNumber2 INTEGER,
    AntennaNumber2 INTEGER,
    PathType CHAR(1),
    PassiveRepeater CHAR(1),
    LinkDistance DECIMAL(5,1),
    InterfacePath CHAR(1),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- RA (Race Information)
CREATE TABLE IF NOT EXISTS RA (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    CallSign CHAR(10),
    EntityType CHAR(2),
    EntityID DECIMAL(9,0),
    RaceReported CHAR(1),
    Gender CHAR(1),
    Ethnicity CHAR(1),
    BlackOrAfricanAmerican CHAR(1),
    AmericanIndianOrAlaskaNative CHAR(1),
    AsianIndian CHAR(1),
    Chinese CHAR(1),
    Filipino CHAR(1),
    Japanese CHAR(1),
    Korean CHAR(1),
    Vietnamese CHAR(1),
    OtherAsian CHAR(1),
    NativeHawaiian CHAR(1),
    GuamanianOrChamorro CHAR(1),
    Samoan CHAR(1),
    OtherPacificIslander CHAR(1),
    White CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- RI (Revenue Information)
CREATE TABLE IF NOT EXISTS RI (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    EntityType CHAR(1),
    YearSequenceID SMALLINT,
    GrossRevenues DECIMAL(15,2),
    YearEndDate DATE,
    AverageGrossRevenues DECIMAL(15,2),
    AssetDisclosure DECIMAL(15,2),
    StatementType CHAR(1),
    In_Existence CHAR(1),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- SI (SIDS)
CREATE TABLE IF NOT EXISTS SI (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    ActionPerformed CHAR(1),
    SIDNumber INTEGER,
    SIDType CHAR(1),
    MarketCode CHAR(6),
    ChannelBlock CHAR(4),
    SubmarketCode INTEGER,
    SubmarketDesc VARCHAR(30),
    StationClass CHAR(4),
    DescriptiveText VARCHAR(255),
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);

-- ST (Sector)
CREATE TABLE IF NOT EXISTS ST (
    RecordType CHAR(2),
    UniqueSystemIdentifier DECIMAL(9,0),
    ULSFileNumber CHAR(14),
    EBFNumber VARCHAR(30),
    CallSign CHAR(10),
    SectorActionPerformed CHAR(1),
    SectorNumber INTEGER,
    PSD_NonPSD_Methodology VARCHAR(10),
    MaximumERP DECIMAL(15,3),
    PSDAttachment CHAR(1),
    LocationNumber INTEGER,
    LocationName VARCHAR(20),
    StatusCode CHAR(1),
    StatusDate DATE,
    FOREIGN KEY (UniqueSystemIdentifier) REFERENCES HD(UniqueSystemIdentifier)
);
