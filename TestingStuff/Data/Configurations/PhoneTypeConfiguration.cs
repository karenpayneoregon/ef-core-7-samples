﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using TestingStuff.Data;
using TestingStuff.Models;

namespace TestingStuff.Data.Configurations
{
    public partial class PhoneTypeConfiguration : IEntityTypeConfiguration<PhoneType>
    {
        public void Configure(EntityTypeBuilder<PhoneType> entity)
        {
            entity.HasKey(e => e.PhoneTypeIdenitfier);

            OnConfigurePartial(entity);
        }

        partial void OnConfigurePartial(EntityTypeBuilder<PhoneType> entity);
    }
}
