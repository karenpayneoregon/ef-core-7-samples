﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace TestingStuff.Models;

public partial class Shippers
{
    public int ShipperId { get; set; }

    public string CompanyName { get; set; }

    public string Phone { get; set; }

    public virtual ICollection<Orders> Orders { get; } = new List<Orders>();
}