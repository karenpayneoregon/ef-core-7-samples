using EntityFrameworkCoreHelpers.Classes;
using Microsoft.EntityFrameworkCore;
using ShadowProperties.Models;

namespace ShadowProperties.Data;

public partial class ShadowContext : DbContext
{
    public ShadowContext()
    {
        
    }
    public ShadowContext(DbContextOptions<ShadowContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Contact> Contacts { get; set; }

    //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    //    => optionsBuilder.UseSqlServer(
    //        """
    //           Server=(localdb)\\mssqllocaldb;Database=EF.ShadowEntityCore;Trusted_Connection=True
    //           """);

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.Entity<Contact>().Property<DateTime?>("LastUpdated");
        modelBuilder.Entity<Contact>().Property<string>("LastUser");
        modelBuilder.Entity<Contact>().Property<DateTime?>("CreatedAt");
        modelBuilder.Entity<Contact>().Property<string>("CreatedBy");
        modelBuilder.Entity<Contact>().Property<bool>("isDeleted");

        modelBuilder.Entity<Contact>(entity => entity.HasKey(e => e.ContactId));

        /*
         * Setup filter on Contact model to show only active records.
         * Since IsDeleted is not in the model the string name is used.
         */
        modelBuilder.Entity<Contact>()
            .HasQueryFilter(contact =>
                EF.Property<bool>(contact, "isDeleted") == false);

        //OnModelCreatingPartial(modelBuilder);

    }

    public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = new ())
    {
        DoShadowyStuff();
        return base.SaveChangesAsync(cancellationToken);
    }

    public override int SaveChanges()
    {
        DoShadowyStuff();
        return base.SaveChanges();
    }

    private void DoShadowyStuff()
    {
        foreach (var entry in ChangeTracker.Entries())
        {
            if (entry.State is EntityState.Added or EntityState.Modified)
            {
                entry.Property("LastUpdated").CurrentValue = DateTime.Now;
                entry.Property("LastUser").CurrentValue = Environment.UserName;

                if (entry.Entity is Contact && entry.State == EntityState.Added)
                {
                    entry.Property("CreatedAt").CurrentValue = DateTime.Now;
                    entry.Property("CreatedBy").CurrentValue = Environment.UserName;
                }
            }
            else if (entry.State == EntityState.Deleted)
            {
                // Change state to modified and set delete flag
                entry.State = EntityState.Modified;
                entry.Property("isDeleted").CurrentValue = true;
            }
        }
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}