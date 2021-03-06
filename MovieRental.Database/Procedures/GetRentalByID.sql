﻿CREATE PROCEDURE [dbo].[GetRentalByID]
	@RentalID int
AS
BEGIN
	SELECT R.RentalId,R.RentalDate,SUM(F.RentalPrice) as TotalPrice 
	FROM Rental as R join RentalDetail as RD 
	ON R.RentalId = RD.RentalId join Film as F 
	ON F.FilmId = RD.FilmId 
	WHERE R.RentalId = @RentalId
	GROUP BY R.RentalId,R.RentalDate 
END
