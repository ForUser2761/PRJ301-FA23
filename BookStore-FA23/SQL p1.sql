USE [master]
GO
/****** Object:  Database [BookStore_FA23]    Script Date: 10/3/2023 8:43:52 PM ******/
CREATE DATABASE [BookStore_FA23]
GO

CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
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
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/3/2023 8:43:52 PM ******/
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

INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (1, N'Muốn Có Gấu, Phải Phấn Đấu', N'abc', CAST(N'2023-09-27T20:18:54.553' AS DateTime), 123, N'123', N'123', 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (2, N'Hoa Học Trò Số 1325', N'abc', CAST(N'2023-09-27T20:20:13.340' AS DateTime), 1234, N'1234', N'1234', 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (3, N'Viva', N'Noam McKie', CAST(N'2023-10-02T20:31:21.050' AS DateTime), 93168, N'Kub, Simonis and Littel', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (4, N'Opela', N'Antonia Stemp', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 38560, N'Cassin-Leffler', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (5, N'Sonair', N'Alejandro Assiter', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 31114, N'Gerhold Inc', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (6, N'Veribet', N'Shoshana Kraft', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 70461, N'Reynolds-Boehm', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (7, N'Quo Lux', N'Renaud Dealtry', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 74905, N'Koelpin-Green', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (8, N'Latlux', N'Edie Hammelberg', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 39019, N'Wilkinson-Hoeger', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (9, N'Rank', N'Guillermo Castilljo', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 63069, N'Ebert and Sons', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (10, N'Tresom', N'Brenna Daley', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 14334, N'Hodkiewicz, Paucek and Kovacek', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (11, N'Veribet', N'Cynthea Chidley', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 53652, N'Jones, Wunsch and Bogan', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (12, N'Daltfresh', N'Guenna Cestard', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 25360, N'Graham-Hilpert', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (13, N'Stronghold', N'Adelind Kellough', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 98424, N'Champlin LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (14, N'Namfix', N'Martguerita Sanders', CAST(N'2023-10-02T20:31:21.057' AS DateTime), 26416, N'Dare-Balistreri', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (15, N'Treeflex', N'Court Eby', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 14804, N'Graham Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (16, N'Fixflex', N'Christoper Asken', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 49020, N'Glover and Sons', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (17, N'Flowdesk', N'Grady Cauderlie', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 51975, N'Abbott-Feil', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (18, N'Ventosanzap', N'Heda Danilishin', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 17554, N'Dach, Lindgren and Stark', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (19, N'Overhold', N'Doralyn Petersen', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 28857, N'Hartmann and Sons', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (20, N'Bitwolf', N'Sharai Lynnett', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 44600, N'Schowalter-Larkin', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (21, N'Transcof', N'Cariotta Edards', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 37976, N'Yost-Breitenberg', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (22, N'Toughjoyfax', N'Alfonso Jurewicz', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 74942, N'Ruecker-Bashirian', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (23, N'Viva', N'Tory Aguirrezabal', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 28358, N'DuBuque, Kozey and Dicki', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (24, N'Flexidy', N'Kary Hawthorn', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 62329, N'Johnston Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (25, N'Namfix', N'Merv Harle', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 79375, N'Wisoky, Nienow and Veum', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (26, N'Sonair', N'Aldin Netting', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 40773, N'Dach, Dach and Sauer', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (27, N'Flexidy', N'Melodee Anthiftle', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 65311, N'Fritsch, Wiegand and Lind', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (28, N'Redhold', N'Fawne McGebenay', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 79288, N'Ziemann-Langworth', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (29, N'Tempsoft', N'Arin Schade', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 62996, N'McCullough Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (30, N'Domainer', N'Dorolisa Tolmie', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 16613, N'Bernier-O''Hara', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (31, N'Treeflex', N'Olga Rait', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 25726, N'Leannon-Ward', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (32, N'Zamit', N'Chris Mableson', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 71475, N'Braun, Cole and Gutmann', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (33, N'Zathin', N'Gorden Gabe', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 51915, N'Huel Inc', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (34, N'Zoolab', N'Gaylene Sibbons', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 30070, N'Stanton-Romaguera', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (35, N'Keylex', N'Lurlene Gonsalvez', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 11078, N'Steuber-Klocko', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (36, N'Overhold', N'Silvano Fergie', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 81522, N'Baumbach-Hansen', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (37, N'Holdlamis', N'Joleen Bastistini', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 42787, N'Jast, Marvin and Runte', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (38, N'Kanlam', N'Pat Terrey', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 54264, N'Ward-Rath', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (39, N'Y-find', N'Dorris Burrus', CAST(N'2023-10-02T20:31:21.060' AS DateTime), 92343, N'Auer, Flatley and VonRueden', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (40, N'Domainer', N'Isador Ivanusyev', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 59008, N'Abernathy-Mraz', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (41, N'Zontrax', N'Prisca Poor', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 29590, N'Bosco-Beier', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (42, N'Alphazap', N'Nady Dutnall', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 73048, N'Kihn, McGlynn and Halvorson', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (43, N'Regrant', N'Fay Alsop', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 84955, N'Balistreri-Von', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (44, N'Transcof', N'Ricardo Castellini', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 33639, N'Abbott-Cummings', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (45, N'Zaam-Dox', N'Trefor Aylesbury', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 87863, N'Rohan-Kassulke', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (46, N'Flexidy', N'Margit Pauletti', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 33661, N'Will-Altenwerth', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (47, N'Veribet', N'Dee dee Gregan', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 64153, N'D''Amore, Russel and Bins', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (48, N'Y-find', N'Anson Salle', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 76064, N'Gutkowski Inc', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (49, N'Fix San', N'Wadsworth Preator', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 72607, N'Bergstrom Inc', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (50, N'Zamit', N'Toddie MacLucais', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 40567, N'Larson, Murray and Sipes', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (51, N'Latlux', N'Flint Sammons', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 56611, N'Mosciski-Lindgren', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (52, N'Solarbreeze', N'Patin Tesoe', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 94355, N'Jacobson, Schmitt and Veum', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (53, N'Toughjoyfax', N'June Barringer', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 97079, N'Schulist-Reynolds', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (54, N'Aerified', N'Averil Stonier', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 71930, N'Cole-Krajcik', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (55, N'Zaam-Dox', N'Calley Trayford', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 57343, N'Daugherty-White', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (56, N'Stringtough', N'Albie Adlam', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 32470, N'Windler, Kunze and Huel', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (57, N'Andalax', N'Danit Revell', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 44927, N'Gottlieb, Schinner and Weissnat', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (58, N'Keylex', N'Jacintha Jakeman', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 43917, N'Bauch, Bartell and Padberg', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (59, N'Overhold', N'Ilene Darmody', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 72365, N'Cronin-Mante', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (60, N'Sonsing', N'Gaby Jacqueminet', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 34914, N'Kling LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (61, N'Bitchip', N'Kennett Morrice', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 25328, N'Ortiz, Wolf and Jerde', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (62, N'Bitchip', N'Jard Renoden', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 75367, N'Hand, Lockman and Predovic', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (63, N'Asoka', N'Lindy Cardenas', CAST(N'2023-10-02T20:31:21.063' AS DateTime), 74223, N'Goldner-Nicolas', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (64, N'Zontrax', N'Valentina Bruhnke', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 44632, N'Quitzon and Sons', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (65, N'Voltsillam', N'Johann O''Drought', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 39792, N'Price, Murray and Pollich', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (66, N'Transcof', N'Andriette Kabisch', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 71933, N'Brakus-Gerlach', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (67, N'Aerified', N'Minerva Jaqueminet', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 41442, N'Roob Inc', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (68, N'Cardguard', N'Maxine Brabben', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 95611, N'Franecki, Wintheiser and Trantow', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (69, N'Lotstring', N'Otis Anster', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 22983, N'Mann, Waters and Welch', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (70, N'Cookley', N'Andy Forge', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 34018, N'McCullough and Sons', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (71, N'Zontrax', N'Ammamaria Wackly', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 90594, N'Stanton, McClure and Grant', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (72, N'Bigtax', N'Binny Imlach', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 21203, N'Adams-Beer', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (73, N'Vagram', N'Gibbie Gutridge', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 16598, N'Mueller-Kris', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (74, N'Asoka', N'Orlando Bulstrode', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 25373, N'McCullough, Emmerich and Stamm', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (75, N'Bigtax', N'Lowell Ledwidge', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 38430, N'Ward-Schiller', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (76, N'Konklab', N'Myer Turbefield', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 28388, N'Rice, Auer and Miller', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (77, N'Y-find', N'Binnie Robelow', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 64064, N'Pacocha-Schiller', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (78, N'Cardguard', N'Sam Thwaites', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 61867, N'Leannon-Yundt', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (79, N'Andalax', N'Dilly Evitt', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 96306, N'Medhurst, Reinger and Grant', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (80, N'Aerified', N'Vasilis Reast', CAST(N'2023-10-02T20:31:21.067' AS DateTime), 26174, N'Crona, Zieme and Farrell', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (81, N'Flowdesk', N'Mair Monget', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 47888, N'Bahringer LLC', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (82, N'Gembucket', N'Natasha Showt', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 88657, N'Hansen, Pfannerstill and Towne', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (83, N'Cookley', N'Zsa zsa Quarry', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 63768, N'Jenkins-Schneider', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (84, N'Fintone', N'Collin Duncklee', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 98795, N'Reichert LLC', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (85, N'Tin', N'Florian Kensall', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 80582, N'Schulist, Marks and Casper', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (86, N'Cookley', N'Stanleigh Blose', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 49102, N'Murphy, Metz and Spinka', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (87, N'Holdlamis', N'Terrel Lund', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 48864, N'Lehner, Osinski and Feil', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (88, N'Aerified', N'Deny Jancey', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 20026, N'Muller-Friesen', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (89, N'Lotlux', N'Nolana Rannie', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 29745, N'Rolfson-Maggio', NULL, 4)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (90, N'Hatity', N'Roland Gligori', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 79245, N'Bartoletti Group', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (91, N'Regrant', N'Darryl Shilito', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 48608, N'Skiles-Bruen', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (92, N'Daltfresh', N'Claudie Culley', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 86122, N'D''Amore, Rutherford and Hayes', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (93, N'Stringtough', N'Bonnee Gurrado', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 24546, N'Streich Inc', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (94, N'Fixflex', N'Axel Itzkovici', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 52354, N'Volkman LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (95, N'Stringtough', N'Toddie Dunstan', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 41054, N'Corwin Group', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (96, N'Asoka', N'Michaeline Sappy', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 27054, N'Kertzmann-Haley', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (97, N'Prodder', N'Rochella Aynscombe', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 57508, N'Lesch-Senger', NULL, 1)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (98, N'Quo Lux', N'Nolan Sapsforde', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 31702, N'Pacocha-Swift', NULL, 3)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (99, N'Tampflex', N'Marleah Haresnaip', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 15577, N'Pacocha LLC', NULL, 3)
GO
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (100, N'Solarbreeze', N'Odella Shortan', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 89378, N'Gutmann LLC', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (101, N'Alpha', N'Charmain Edward', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 55812, N'Bailey-MacGyver', NULL, 2)
INSERT [dbo].[Book] ([id], [name], [author], [date_of_public], [price], [publisher], [description], [categoryId]) VALUES (102, N'Kanlam', N'Norry Bachanski', CAST(N'2023-10-02T20:31:21.070' AS DateTime), 14973, N'Bahringer, Cummerata and Auer', NULL, 3)
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
