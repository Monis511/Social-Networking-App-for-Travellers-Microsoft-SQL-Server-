CREATE TABLE [Users] (
    userId INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    ContactNo VARCHAR(20),
    location VARCHAR(255),
    address VARCHAR(255),
    [password] VARCHAR(255),
    Email_id VARCHAR(255) UNIQUE,
    DOB DATE
);

CREATE TABLE Travel_Buddies (
    FriendId INT PRIMARY KEY IDENTITY,
    EmailId VARCHAR(255) UNIQUE,
    DOB DATE,
    FriendShipStatus VARCHAR(50),
    FriendTourId INT,
    co_tours INT,
    FrEmail VARCHAR(255),
    FOREIGN KEY (EmailId) REFERENCES [Users](Email_id)
);

CREATE TABLE Inbox_Messages (
    MessageId INT PRIMARY KEY IDENTITY,
    From_id INT,
    To_id INT,
    Media VARCHAR(255),
    Message TEXT,
    FOREIGN KEY (From_id) REFERENCES [Users](userId)
);

CREATE TABLE Photos (
    photoId INT PRIMARY KEY IDENTITY,
    userId INT,
    Email_id VARCHAR(255),
    upload_time DATETIME,
    likes INT,
    caption VARCHAR(255),
    is_visible_to VARCHAR(50),
    FOREIGN KEY (userId) REFERENCES [Users](userId),
    FOREIGN KEY (Email_id) REFERENCES [Users](Email_id)
);

CREATE TABLE Likes (
    like_id INT PRIMARY KEY IDENTITY,
    photo_id INT,
    user_id INT,
    FOREIGN KEY (photo_id) REFERENCES Photos(photoId),
);

CREATE TABLE Comments (
    CommentId INT PRIMARY KEY,
    UserId INT,
    Timestamp DATETIME,
    PhotoId INT,
    CommentText NVARCHAR(MAX),
    FOREIGN KEY (UserId) REFERENCES [Users](userId),
    FOREIGN KEY (PhotoId) REFERENCES Photos(photoId)
);


CREATE TABLE TravelProfile (
    travelId INT PRIMARY KEY,
    userId INT,
    [password] VARCHAR(255) UNIQUE,
    username VARCHAR(255),
    FOREIGN KEY (userId) REFERENCES [Users](userId)
);

CREATE TABLE places_been_to (
    SrNumber INT PRIMARY KEY,
    userId INT,
    travelId INT,
    location VARCHAR(255),
    Expenses DECIMAL(10, 2),
    groupId INT,
    groupMembers VARCHAR(255),
    guideId INT,
    guideName VARCHAR(255),
    FOREIGN KEY (userId) REFERENCES [Users](userId),
    FOREIGN KEY (travelId) REFERENCES TravelProfile(travelId)
);

CREATE TABLE Hotel (
    hotelId INT PRIMARY KEY,
    hotelName VARCHAR(255),
    address VARCHAR(255),
    roomId INT UNIQUE,
    NoOfBeds INT,
    DurationOfStay INT,
    NatureOfStay VARCHAR(255)
);

CREATE TABLE BucketList (
    DestinationId INT PRIMARY KEY,
    UserId INT,
    Destination VARCHAR(255),
    Location VARCHAR(255),
    Description TEXT,
    Priority INT,
    FOREIGN KEY (UserId) REFERENCES [Users](userId)
);
