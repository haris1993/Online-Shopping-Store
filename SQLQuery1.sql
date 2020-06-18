
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetBySearch 
	@search nvarchar(max)=null
AS
BEGIN
	SELECT *from [dbo].[Tbl_Product] P
	left join [dbo].[Tbl_Category] C on P.CategoryId=C.CategoryId
	where 
	P.ProductName LIKE CASE WHEN @search is not null THEN '%'+@search+'%' ELSE P.ProductName END
	OR
	C.CategoryName LIKE CASE WHEN @search is not null THEN '%'+@search+'%' ELSE C.CategoryName END
END
GO
