USE [master]
GO
/****** Object:  Database [BookStore_FA23]    Script Date: 10/11/2023 4:50:59 PM ******/
CREATE DATABASE [BookStore_FA23]
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[image] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[author] [nvarchar](50) NOT NULL,
	[date_of_public] [datetime] NOT NULL,
	[price] [int] NOT NULL,
	[publisher] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[categoryId] [int] NOT NULL,
 CONSTRAINT [PK_Book_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/11/2023 4:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (1, N'Muốn Có Gấu, Phải Phấn Đấu', NULL, NULL, N'abc', CAST(N'2023-09-27T20:18:54.553' AS DateTime), 123, N'123', N'123', 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (2, N'Hoa Học Trò Số 1325', NULL, NULL, N'abc', CAST(N'2023-09-27T20:20:13.340' AS DateTime), 1234, N'1234', N'1234', 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (3, N'Viva', NULL, NULL, N'Noam McKie', CAST(N'2023-10-02T20:31:21.050' AS DateTime), 93168, N'Kub, Simonis and Littel', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (4, N'Opela', NULL, NULL, N'Antonia Stemp', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 38560, N'Cassin-Leffler', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (5, N'Sonair', NULL, NULL, N'Alejandro Assiter', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 31114, N'Gerhold Inc', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (6, N'Veribet', NULL, NULL, N'Shoshana Kraft', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 70461, N'Reynolds-Boehm', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (7, N'Quo Lux', NULL, NULL, N'Renaud Dealtry', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 74905, N'Koelpin-Green', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (8, N'Latlux', NULL, NULL, N'Edie Hammelberg', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 39019, N'Wilkinson-Hoeger', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (9, N'Rank', NULL, NULL, N'Guillermo Castilljo', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 63069, N'Ebert and Sons', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (10, N'Tresom', NULL, NULL, N'Brenna Daley', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 14334, N'Hodkiewicz, Paucek and Kovacek', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (11, N'Veribet', NULL, NULL, N'Cynthea Chidley', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 53652, N'Jones, Wunsch and Bogan', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (12, N'Daltfresh', NULL, NULL, N'Guenna Cestard', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 25360, N'Graham-Hilpert', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (13, N'Stronghold', NULL, NULL, N'Adelind Kellough', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 98424, N'Champlin LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (14, N'Namfix', NULL, NULL, N'Martguerita Sanders', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 26416, N'Dare-Balistreri', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (15, N'Treeflex', NULL, NULL, N'Court Eby', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 14804, N'Graham Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (16, N'Fixflex', NULL, NULL, N'Christoper Asken', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 49020, N'Glover and Sons', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (17, N'Flowdesk', NULL, NULL, N'Grady Cauderlie', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 51975, N'Abbott-Feil', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (18, N'Ventosanzap', NULL, NULL, N'Heda Danilishin', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 17554, N'Dach, Lindgren and Stark', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (19, N'Overhold', NULL, NULL, N'Doralyn Petersen', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 28857, N'Hartmann and Sons', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (20, N'Bitwolf', NULL, NULL, N'Sharai Lynnett', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 44600, N'Schowalter-Larkin', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (21, N'Transcof', NULL, NULL, N'Cariotta Edards', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 37976, N'Yost-Breitenberg', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (22, N'Toughjoyfax', NULL, NULL, N'Alfonso Jurewicz', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 74942, N'Ruecker-Bashirian', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (23, N'Viva', NULL, NULL, N'Tory Aguirrezabal', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 28358, N'DuBuque, Kozey and Dicki', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (24, N'Flexidy', NULL, NULL, N'Kary Hawthorn', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 62329, N'Johnston Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (25, N'Namfix', NULL, NULL, N'Merv Harle', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 79375, N'Wisoky, Nienow and Veum', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (26, N'Sonair', NULL, NULL, N'Aldin Netting', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 40773, N'Dach, Dach and Sauer', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (27, N'Flexidy', NULL, NULL, N'Melodee Anthiftle', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 65311, N'Fritsch, Wiegand and Lind', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (28, N'Redhold', NULL, NULL, N'Fawne McGebenay', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 79288, N'Ziemann-Langworth', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (29, N'Tempsoft', NULL, NULL, N'Arin Schade', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 62996, N'McCullough Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (30, N'Domainer', NULL, NULL, N'Dorolisa Tolmie', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 16613, N'Bernier-O''Hara', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (31, N'Treeflex', NULL, NULL, N'Olga Rait', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 25726, N'Leannon-Ward', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (32, N'Zamit', NULL, NULL, N'Chris Mableson', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 71475, N'Braun, Cole and Gutmann', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (33, N'Zathin', NULL, NULL, N'Gorden Gabe', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 51915, N'Huel Inc', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (34, N'Zoolab', NULL, NULL, N'Gaylene Sibbons', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 30070, N'Stanton-Romaguera', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (35, N'Keylex', NULL, NULL, N'Lurlene Gonsalvez', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 11078, N'Steuber-Klocko', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (36, N'Overhold', NULL, NULL, N'Silvano Fergie', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 81522, N'Baumbach-Hansen', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (37, N'Holdlamis', NULL, NULL, N'Joleen Bastistini', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 42787, N'Jast, Marvin and Runte', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (38, N'Kanlam', NULL, NULL, N'Pat Terrey', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 54264, N'Ward-Rath', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (39, N'Y-find', NULL, NULL, N'Dorris Burrus', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 92343, N'Auer, Flatley and VonRueden', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (40, N'Domainer', NULL, NULL, N'Isador Ivanusyev', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 59008, N'Abernathy-Mraz', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (41, N'Zontrax', NULL, NULL, N'Prisca Poor', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 29590, N'Bosco-Beier', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (42, N'Alphazap', NULL, NULL, N'Nady Dutnall', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 73048, N'Kihn, McGlynn and Halvorson', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (43, N'Regrant', NULL, NULL, N'Fay Alsop', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 84955, N'Balistreri-Von', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (44, N'Transcof', NULL, NULL, N'Ricardo Castellini', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 33639, N'Abbott-Cummings', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (45, N'Zaam-Dox', NULL, NULL, N'Trefor Aylesbury', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 87863, N'Rohan-Kassulke', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (46, N'Flexidy', NULL, NULL, N'Margit Pauletti', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 33661, N'Will-Altenwerth', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (47, N'Veribet', NULL, NULL, N'Dee dee Gregan', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 64153, N'D''Amore, Russel and Bins', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (48, N'Y-find', NULL, NULL, N'Anson Salle', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 76064, N'Gutkowski Inc', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (49, N'Fix San', NULL, NULL, N'Wadsworth Preator', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 72607, N'Bergstrom Inc', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (50, N'Zamit', NULL, NULL, N'Toddie MacLucais', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 40567, N'Larson, Murray and Sipes', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (51, N'Latlux', NULL, NULL, N'Flint Sammons', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 56611, N'Mosciski-Lindgren', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (52, N'Solarbreeze', NULL, NULL, N'Patin Tesoe', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 94355, N'Jacobson, Schmitt and Veum', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (53, N'Toughjoyfax', NULL, NULL, N'June Barringer', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 97079, N'Schulist-Reynolds', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (54, N'Aerified', NULL, NULL, N'Averil Stonier', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 71930, N'Cole-Krajcik', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (55, N'Zaam-Dox', NULL, NULL, N'Calley Trayford', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 57343, N'Daugherty-White', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (56, N'Stringtough', NULL, NULL, N'Albie Adlam', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 32470, N'Windler, Kunze and Huel', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (57, N'Andalax', NULL, NULL, N'Danit Revell', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 44927, N'Gottlieb, Schinner and Weissnat', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (58, N'Keylex', NULL, NULL, N'Jacintha Jakeman', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 43917, N'Bauch, Bartell and Padberg', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (59, N'Overhold', NULL, NULL, N'Ilene Darmody', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 72365, N'Cronin-Mante', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (60, N'Sonsing', NULL, NULL, N'Gaby Jacqueminet', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 34914, N'Kling LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (61, N'Bitchip', NULL, NULL, N'Kennett Morrice', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 25328, N'Ortiz, Wolf and Jerde', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (62, N'Bitchip', NULL, NULL, N'Jard Renoden', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 75367, N'Hand, Lockman and Predovic', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (63, N'Asoka', NULL, NULL, N'Lindy Cardenas', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 74223, N'Goldner-Nicolas', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (64, N'Zontrax', NULL, NULL, N'Valentina Bruhnke', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 44632, N'Quitzon and Sons', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (65, N'Voltsillam', NULL, NULL, N'Johann O''Drought', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 39792, N'Price, Murray and Pollich', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (66, N'Transcof', NULL, NULL, N'Andriette Kabisch', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 71933, N'Brakus-Gerlach', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (67, N'Aerified', NULL, NULL, N'Minerva Jaqueminet', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 41442, N'Roob Inc', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (68, N'Cardguard', NULL, NULL, N'Maxine Brabben', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 95611, N'Franecki, Wintheiser and Trantow', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (69, N'Lotstring', NULL, NULL, N'Otis Anster', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 22983, N'Mann, Waters and Welch', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (70, N'Cookley', NULL, NULL, N'Andy Forge', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 34018, N'McCullough and Sons', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (71, N'Zontrax', NULL, NULL, N'Ammamaria Wackly', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 90594, N'Stanton, McClure and Grant', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (72, N'Bigtax', NULL, NULL, N'Binny Imlach', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 21203, N'Adams-Beer', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (73, N'Vagram', NULL, NULL, N'Gibbie Gutridge', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 16598, N'Mueller-Kris', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (74, N'Asoka', NULL, NULL, N'Orlando Bulstrode', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 25373, N'McCullough, Emmerich and Stamm', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (75, N'Bigtax', NULL, NULL, N'Lowell Ledwidge', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 38430, N'Ward-Schiller', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (76, N'Konklab', NULL, NULL, N'Myer Turbefield', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 28388, N'Rice, Auer and Miller', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (77, N'Y-find', NULL, NULL, N'Binnie Robelow', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 64064, N'Pacocha-Schiller', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (78, N'Cardguard', NULL, NULL, N'Sam Thwaites', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 61867, N'Leannon-Yundt', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (79, N'Andalax', NULL, NULL, N'Dilly Evitt', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 96306, N'Medhurst, Reinger and Grant', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (80, N'Aerified', NULL, NULL, N'Vasilis Reast', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 26174, N'Crona, Zieme and Farrell', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (81, N'Flowdesk', NULL, NULL, N'Mair Monget', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 47888, N'Bahringer LLC', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (82, N'Gembucket', NULL, NULL, N'Natasha Showt', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 88657, N'Hansen, Pfannerstill and Towne', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (83, N'Cookley', NULL, NULL, N'Zsa zsa Quarry', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 63768, N'Jenkins-Schneider', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (84, N'Fintone', NULL, NULL, N'Collin Duncklee', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 98795, N'Reichert LLC', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (85, N'Tin', NULL, NULL, N'Florian Kensall', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 80582, N'Schulist, Marks and Casper', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (86, N'Cookley', NULL, NULL, N'Stanleigh Blose', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 49102, N'Murphy, Metz and Spinka', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (87, N'Holdlamis', NULL, NULL, N'Terrel Lund', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 48864, N'Lehner, Osinski and Feil', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (88, N'Aerified', NULL, NULL, N'Deny Jancey', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 20026, N'Muller-Friesen', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (89, N'Lotlux', NULL, NULL, N'Nolana Rannie', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 29745, N'Rolfson-Maggio', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (90, N'Hatity', NULL, NULL, N'Roland Gligori', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 79245, N'Bartoletti Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (91, N'Regrant', NULL, NULL, N'Darryl Shilito', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 48608, N'Skiles-Bruen', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (92, N'Daltfresh', NULL, NULL, N'Claudie Culley', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 86122, N'D''Amore, Rutherford and Hayes', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (93, N'Stringtough', NULL, NULL, N'Bonnee Gurrado', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 24546, N'Streich Inc', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (94, N'Fixflex', NULL, NULL, N'Axel Itzkovici', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 52354, N'Volkman LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (95, N'Stringtough', NULL, NULL, N'Toddie Dunstan', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 41054, N'Corwin Group', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (96, N'Asoka', NULL, NULL, N'Michaeline Sappy', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 27054, N'Kertzmann-Haley', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (97, N'Prodder', NULL, NULL, N'Rochella Aynscombe', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 57508, N'Lesch-Senger', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (98, N'Quo Lux', NULL, NULL, N'Nolan Sapsforde', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 31702, N'Pacocha-Swift', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (99, N'Tampflex', NULL, NULL, N'Marleah Haresnaip', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 15577, N'Pacocha LLC', NULL, 3)
GO
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (100, N'Solarbreeze', NULL, NULL, N'Odella Shortan', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 89378, N'Gutmann LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (101, N'Alpha', NULL, NULL, N'Charmain Edward', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 55812, N'Bailey-MacGyver', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [image], [quantity], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (102, N'Kanlam', NULL, NULL, N'Norry Bachanski', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 14973, N'Bahringer, Cummerata and Auer', NULL, 3)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Văn học')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Tiểu thuyết')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Manga')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Ngôn Tình')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_date_of_public]  DEFAULT (getdate()) FOR [date_of_public]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
USE [master]
GO
ALTER DATABASE [BookStore_FA23] SET  READ_WRITE 
GO
