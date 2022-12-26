using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityFrameworkCoreHelpers.Interfaces;
public interface IBaseEntity
{
    int Id { get; set; }
    //DateTime ModifiedDate { get; set; }
    //int ModifiedByUserId { get; set; }
}