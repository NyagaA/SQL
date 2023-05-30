	--Used the Nashville Housing Dataset to demonstrate data cleaning using SQL.
		
--1. STANDARDIZING DATE FORMAT OF SALESDATE COLUMN
	--Method 1
		 SELECT SaleDate, CONVERT(Date, SaleDate)
		 FROM Projects.dbo.NashvilleHousing;

		 UPDATE NashvilleHousing                     --didn't update on the table so went for method  2
		 SET SaleDate = CONVERT(Date, SaleDate);

	--Method 2
		 ALTER Table NashvilleHousing
		 Add SaleDate2 Date;

		 UPDATE NashvilleHousing
		 SET SaleDate2 = CONVERT(Date, SaleDate);

		 SELECT SaleDate2
		 FROM Projects.dbo.NashvilleHousing;

--2. POPULATE PROPERTY ADDRESS WHERE VALUE IS NULL

		  SELECT *
		  FROM Projects.dbo.NashvilleHousing
		  WHERE PropertyAddress is null
		  ORDER BY ParcelID desc
		
		/*Helps see a reference point of propertyaddress and we find that, where we have the same uniqueid, 
		we have the same address. We use self join to populate the propertyaddress*/
		
		   SELECT *
		   FROM Projects.dbo.NashvilleHousing
		   ORDER BY ParcelID desc;

		   SELECT NH1.ParcelID, NH1.ParcelID, 
			NH2.ParcelID, NH2.PropertyAddress,
			ISNULL(NH1.PropertyAddress, NH2.PropertyAddress)
		   FROM Projects.dbo.NashvilleHousing NH1
		   JOIN Projects.dbo.NashvilleHousing NH2
			ON NH1.PropertyAddress = NH2.ParcelID
			AND NH1.[UniqueID ] != NH2.[UniqueID ]
		   WHERE NH1.PropertyAddress is null;

		   UPDATE NH1
		   SET PropertyAddress = ISNULL(NH1.PropertyAddress, NH2.PropertyAddress)
		   FROM Projects.dbo.NashvilleHousing NH1
		   JOIN Projects.dbo.NashvilleHousing NH2
			ON NH1.PropertyAddress = NH2.ParcelID
			AND NH1.[UniqueID ] != NH2.[UniqueID ]
		   WHERE NH1.PropertyAddress is null;


--3. SEPARATING ADDRESS INTO INDIVIDUAL COLUMNS (ADDRESS, CITY, STATE)
	--a) PropertyAddress (splitting into Address and City)

		    SELECT PropertyAddress
		    FROM Projects.dbo.NashvilleHousing;

		    SELECT
				SUBSTRING(PropertyAddress,1, CHARINDEX(',',PropertyAddress)-1) as Address --splits PropertyAddress starting from the first character to the comma
				, SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress)) as City --splits PropertyAddress starting from the comma to the end
		    FROM Projects.dbo.NashvilleHousing;

      	-- Creating SplitPropertyAddress column
		    ALTER TABLE NashvilleHousing
		    ADD SplitPropertyAddress Nvarchar(255);

		    UPDATE NashvilleHousing
		    SET SplitPropertyAddress = SUBSTRING(PropertyAddress,1, CHARINDEX(',',PropertyAddress)-1);

       	-- Creating SplitPropertyCity column
		    ALTER TABLE NashvilleHousing
		    ADD SplitPropertyCity Nvarchar(255);

		    UPDATE NashvilleHousing
		    SET SplitPropertyCity = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1, LEN(PropertyAddress));

 	--b) OwnerAddress (splitting into Address, City and State)
 
		    SELECT OwnerAddress
		    FROM Projects.dbo.NashvilleHousing;

		    SELECT
			PARSENAME(REPLACE(OwnerAddress, ',' , '.'),3) as SplitOwnerAddress
			,PARSENAME(REPLACE(OwnerAddress, ',' , '.'),2) as SplitOwnerCity
			,PARSENAME(REPLACE(OwnerAddress, ',' , '.'),1) as SplitOwnerState
		    FROM Projects.dbo.NashvilleHousing;

	-- Creating SplitOwnerAddress column
		    ALTER TABLE NashvilleHousing
	            ADD SplitOwnerAddress Nvarchar(255);

		    UPDATE NashvilleHousing
		    SET SplitOwnerAddress = PARSENAME(REPLACE(OwnerAddress, ',' , '.'),3)

	-- Creating SplitOwnerCity column
		    ALTER TABLE NashvilleHousing
		    ADD SplitOwnerCity Nvarchar(255);

		    UPDATE NashvilleHousing
		    SET SplitOwnerCity = PARSENAME(REPLACE(OwnerAddress, ',' , '.'),2)

	-- Creating SplitOwnerState column
		    ALTER TABLE NashvilleHousing
		    ADD SplitOwnerState Nvarchar(255);

	            UPDATE NashvilleHousing
		    SET SplitOwnerState = PARSENAME(REPLACE(OwnerAddress, ',' , '.'),1)


--4. CHANGE Y AND N TO YES AND NO IN 'SOLDASVACANT' FIELD

		    SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
		    FROM Projects.dbo.NashvilleHousing
		    GROUP BY SOldAsVacant
		    ORDER BY 2;

		    SELECT SoldAsVacant,
			    CASE 
				WHEN SoldAsVacant = 'Y' THEN 'YES'
				WHEN SoldAsVacant = 'N' THEN 'NO'
				ELSE SoldAsVacant
				END
		    FROM Projects.dbo.NashvilleHousing;

		    UPDATE NashvilleHousing
		    SET SoldAsVacant = CASE 
				     WHEN SoldAsVacant = 'Y' THEN 'YES'
				     WHEN SoldAsVacant = 'N' THEN 'NO'
				     ELSE SoldAsVacant
		                     END;

--5. REMOVE DUPLICATES
	--Using ROW_NUMBER to assign a unique value to each of the records	
		    SELECT *,
		      ROW_NUMBER () OVER (
		      PARTITION BY ParcelID
			      , PropertyAddress
			      , SalePrice
			      , SaleDate
			      , LegalReference
		      ORDER BY UniqueID ) as row_num
		    FROM Projects.dbo.NashvilleHousing
		    ORDER BY ParcelID;

	--Finding the total number of duplicate records using a CTE
		    With Row_number_CTE
			   AS (
				SELECT *,
				ROW_NUMBER () OVER (
				PARTITION BY ParcelID
							, PropertyAddress
							, SalePrice
							, SaleDate
							, LegalReference
				ORDER BY UniqueID ) as row_num
		       FROM Projects.dbo.NashvilleHousing
				 )
			SELECT *
			FROM Row_number_CTE
			WHERE row_num > 1
			ORDER BY ParcelID;

			--Removing Duplicates
			With Row_number_CTE
			AS (
				SELECT *,
				ROW_NUMBER () OVER (
				PARTITION BY ParcelID
							, PropertyAddress
							, SalePrice
							, SaleDate
							, LegalReference
				ORDER BY UniqueID ) as row_num
			FROM Projects.dbo.NashvilleHousing
				 )
			DELETE
			FROM Row_number_CTE
			WHERE row_num > 1;


--6. DELETING UNUSED COLUMNS (eg.in a view)
			ALTER TABLE NashvilleHousing
			DROP COLUMN OwnerAddress
						, TaxDistrict
						, PropertyAddress
						, SaleDate
			;
 
