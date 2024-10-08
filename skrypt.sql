USE [Przychodnia]
GO
/****** Object:  Table [dbo].[Choroby]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choroby](
	[Id wizyty] [int] NOT NULL,
	[Kod choroby] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Rozpoznanie] PRIMARY KEY CLUSTERED 
(
	[Id wizyty] ASC,
	[Kod choroby] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ICD10]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ICD10](
	[Kod Choroby] [nchar](10) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[Kod Choroby Nadrzednej] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ICD10] PRIMARY KEY CLUSTERED 
(
	[Kod Choroby] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leki]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leki](
	[Id Leku] [int] NOT NULL,
	[Nazwa leku] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Leki] PRIMARY KEY CLUSTERED 
(
	[Id Leku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacjenci]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacjenci](
	[Id Pacjenta] [int] IDENTITY(1,1) NOT NULL,
	[Imie Pacjenta] [nvarchar](50) NOT NULL,
	[Nazwisko Pacjenta] [nvarchar](50) NOT NULL,
	[Pesel] [int] NOT NULL,
 CONSTRAINT [PK_Pacjenci] PRIMARY KEY CLUSTERED 
(
	[Id Pacjenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[Id Personelu] [int] IDENTITY(1,1) NOT NULL,
	[Id Stanowiska] [int] NOT NULL,
	[Imie] [nvarchar](50) NOT NULL,
	[Nazwisko] [nvarchar](50) NOT NULL,
	[Nr pozwolenia] [int] NOT NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[Id Personelu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przepisane Leki]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przepisane Leki](
	[Id Wizyty] [int] NOT NULL,
	[Id Leku] [int] NOT NULL,
	[Dawka] [int] NOT NULL,
 CONSTRAINT [PK_Przepisane Leki] PRIMARY KEY CLUSTERED 
(
	[Id Wizyty] ASC,
	[Id Leku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stanowiska]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stanowiska](
	[Id Stanowiska] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa Stanowiska] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Stanowiska] PRIMARY KEY CLUSTERED 
(
	[Id Stanowiska] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wizyty]    Script Date: 05.01.2022 20:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wizyty](
	[Id Wizyty] [int] IDENTITY(1,1) NOT NULL,
	[Id Personelu] [int] NOT NULL,
	[Id Pacjenta] [int] NOT NULL,
	[Godzina] [datetime] NOT NULL,
	[Data] [date] NOT NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Wizyty] PRIMARY KEY CLUSTERED 
(
	[Id Wizyty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Choroby]  WITH CHECK ADD  CONSTRAINT [FK_Rozpoznanie_ICD10] FOREIGN KEY([Kod choroby])
REFERENCES [dbo].[ICD10] ([Kod Choroby])
GO
ALTER TABLE [dbo].[Choroby] CHECK CONSTRAINT [FK_Rozpoznanie_ICD10]
GO
ALTER TABLE [dbo].[Choroby]  WITH CHECK ADD  CONSTRAINT [FK_Rozpoznanie_Wizyty] FOREIGN KEY([Id wizyty])
REFERENCES [dbo].[Wizyty] ([Id Wizyty])
GO
ALTER TABLE [dbo].[Choroby] CHECK CONSTRAINT [FK_Rozpoznanie_Wizyty]
GO
ALTER TABLE [dbo].[ICD10]  WITH CHECK ADD  CONSTRAINT [FK_ICD10_ICD10] FOREIGN KEY([Kod Choroby Nadrzednej])
REFERENCES [dbo].[ICD10] ([Kod Choroby])
GO
ALTER TABLE [dbo].[ICD10] CHECK CONSTRAINT [FK_ICD10_ICD10]
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD  CONSTRAINT [FK_Personel_Stanowiska] FOREIGN KEY([Id Stanowiska])
REFERENCES [dbo].[Stanowiska] ([Id Stanowiska])
GO
ALTER TABLE [dbo].[Personel] CHECK CONSTRAINT [FK_Personel_Stanowiska]
GO
ALTER TABLE [dbo].[Przepisane Leki]  WITH CHECK ADD  CONSTRAINT [FK_Przepisane Leki_Leki] FOREIGN KEY([Id Leku])
REFERENCES [dbo].[Leki] ([Id Leku])
GO
ALTER TABLE [dbo].[Przepisane Leki] CHECK CONSTRAINT [FK_Przepisane Leki_Leki]
GO
ALTER TABLE [dbo].[Przepisane Leki]  WITH CHECK ADD  CONSTRAINT [FK_Przepisane Leki_Wizyty] FOREIGN KEY([Id Wizyty])
REFERENCES [dbo].[Wizyty] ([Id Wizyty])
GO
ALTER TABLE [dbo].[Przepisane Leki] CHECK CONSTRAINT [FK_Przepisane Leki_Wizyty]
GO
ALTER TABLE [dbo].[Wizyty]  WITH CHECK ADD  CONSTRAINT [FK_Wizyty_Pacjenci] FOREIGN KEY([Id Pacjenta])
REFERENCES [dbo].[Pacjenci] ([Id Pacjenta])
GO
ALTER TABLE [dbo].[Wizyty] CHECK CONSTRAINT [FK_Wizyty_Pacjenci]
GO
ALTER TABLE [dbo].[Wizyty]  WITH CHECK ADD  CONSTRAINT [FK_Wizyty_Personel] FOREIGN KEY([Id Personelu])
REFERENCES [dbo].[Personel] ([Id Personelu])
GO
ALTER TABLE [dbo].[Wizyty] CHECK CONSTRAINT [FK_Wizyty_Personel]
GO
