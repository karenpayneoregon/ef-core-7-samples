﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using TestingStuff.Data;
using TestingStuff.Models;

namespace TestingStuff.Data.Configurations
{
    public partial class SupplierRegionConfiguration : IEntityTypeConfiguration<SupplierRegion>
    {
        public void Configure(EntityTypeBuilder<SupplierRegion> entity)
        {
            entity.HasKey(e => e.RegionId);

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<SupplierRegion> entity);
    }
}